import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phrasly_ai_tools/src/core/constants/hive_config.dart';
import 'package:phrasly_ai_tools/src/core/services/logger/logger.dart';
import 'package:phrasly_ai_tools/src/core/services/purchases/revenue_cat_service.dart';
import 'package:phrasly_ai_tools/src/core/services/remote_config/models/remote_config_models.dart';
import 'package:phrasly_ai_tools/src/core/services/remote_config/remote_config_service.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  final RevenueCatService _revenueCatService;
  final RemoteConfigService _remoteConfigService;
  final _logger = getLogger('SubscriptionCubit');

  // Usage tracking keys
  static const String _freeLimitKey = RemoteConfigKeys.freeLimit;

  SubscriptionCubit(this._revenueCatService, this._remoteConfigService) : super(const SubscriptionState.initial()) {
    _initializeUsageTracking();
  }

  /// Initialize usage tracking and reset if needed
  void _initializeUsageTracking() {
    _updateUsageState();
  }

  /// Update state with current usage
  void _updateUsageState() {
    final freeLimit = purchasesBox.get(_freeLimitKey, defaultValue: 0) as int;

    emit(state.copyWith(freeLimit: freeLimit));
  }

  /// Check subscription status
  Future<void> checkSubscriptionStatus() async {
    try {
      emit(state.copyWith(isLoading: true, error: null));
      if (devBox.get('isDevPro', defaultValue: false)) {
        emit(state.copyWith(isSubscriber: true));
        return;
      }

      // Get customer info from RevenueCat
      final customerInfo = await Purchases.getCustomerInfo();

      // Check if user has active subscriptions
      final isSubscriber = customerInfo.activeSubscriptions.isNotEmpty;

      emit(state.copyWith(
        isLoading: false,
        isSubscriber: isSubscriber,
        customerInfo: customerInfo,
      ));

      _logger.i('Subscription status checked: isSubscriber = $isSubscriber');
    } catch (e, stackTrace) {
      _logger.e('Failed to check subscription status: $e', error: e, stackTrace: stackTrace);

      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  /// Present paywall and check status after
  Future<void> showPaywall(PaywallOffers paywallOffer) async {
    if (state.isSubscriber) return;
    try {
      emit(state.copyWith(isLoading: true, error: null));

      // Present paywall
      await _revenueCatService.presentPaywallIfNeeded(paywallOffer);

      // Check status after paywall interaction
      await checkSubscriptionStatus();

      if (!state.isSubscriber &&
          paywallOffer != PaywallOffers.second_offer &&
          _remoteConfigService.data.revenueCat.showDiscountAfterPaywall) {
        await showPaywall(PaywallOffers.second_offer);
      }
    } catch (e) {
      _logger.e('Failed to present paywall: $e');
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> showAppOpenPaywall() async {
    if (state.isSubscriber) return;

    bool isFirstAppOpen = purchasesBox.get('is_first_app_open', defaultValue: true);

    if (isFirstAppOpen) {
      await showPaywall(PaywallOffers.first_offer);
      purchasesBox.put('is_first_app_open', false);
    } else {
      await showPaywall(PaywallOffers.second_offer);
    }
  }

  /// Track usage for content generation
  Future<bool> canUseAiTools() async {
    if (state.isSubscriber) return true; // Subscribers have unlimited usage

    final currentUsage = state.freeLimit;
    final limit = _remoteConfigService.data.revenueCat.freeLimit;

    if (currentUsage >= limit) {
      showPaywall(PaywallOffers.second_offer);
      return false; // Limit reached
    }

    final newUsage = currentUsage + 1;
    purchasesBox.put(_freeLimitKey, newUsage);
    emit(state.copyWith(freeLimit: newUsage));

    _logger.i('Content generation usage: $newUsage/$limit');
    return true;
  }
}
