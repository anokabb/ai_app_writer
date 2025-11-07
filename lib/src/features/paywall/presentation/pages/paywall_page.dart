import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/purchases/revenue_cat_service.dart';
import 'package:phrasly_ai_tools/src/core/services/purchases/subscription_cubit.dart';
import 'package:phrasly_ai_tools/src/core/services/remote_config/remote_config_service.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class PaywallPage extends StatefulWidget {
  static const String routeName = '/paywall';

  final PaywallOffers paywallOffer;

  const PaywallPage({
    super.key,
    required this.paywallOffer,
  });

  @override
  State<PaywallPage> createState() => _PaywallPageState();
}

class _PaywallPageState extends State<PaywallPage> {
  Offering? _offering;
  bool _isLoading = true;
  String? _error;

  bool closeIsLoading = true;

  @override
  void initState() {
    super.initState();
    _loadOffering();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
          Duration(
            seconds: kDebugMode ? 0 : locator<RemoteConfigService>().data.revenueCat.closeButtonDelay,
          ), () {
        log('close delay ${locator<RemoteConfigService>().data.revenueCat.closeButtonDelay}');
        setState(() {
          closeIsLoading = false;
        });
      });
    });
  }

  Future<void> _loadOffering() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final offerings = await Purchases.getOfferings();
      // Use the specific offering based on the paywall offer parameter
      final offering = offerings.all[widget.paywallOffer.name];

      if (offering == null) {
        throw Exception('Offering not found for ${widget.paywallOffer.name}');
      }

      setState(() {
        _offering = offering;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    if (_error != null || _offering == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load paywall',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _loadOffering,
              child: const Text('Retry'),
            ),
            const SizedBox(height: 6),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      );
    }

    return Stack(
      children: [
        PaywallView(
          offering: _offering!,
          onRestoreCompleted: (CustomerInfo customerInfo) {
            // Handle restore completion
            _onRestoreCompleted(customerInfo);
          },
          onDismiss: () {
            // Handle paywall dismissal
            _onDismiss();
          },
        ),
        Positioned(
          top: 16,
          right: 16,
          child: SafeArea(
            child: closeIsLoading
                ? Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.35),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: const CircularProgressIndicator(
                        strokeWidth: 1,
                        color: Colors.white,
                      ),
                    ),
                  )
                : AppCupertinoButton(
                    onTap: () => _onDismiss(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.35),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      width: 36,
                      height: 36,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  void _onRestoreCompleted(CustomerInfo customerInfo) {
    // Update subscription status
    locator<SubscriptionCubit>().checkSubscriptionStatus();

    showTopAlert('Subscription restored successfully!');
  }

  void _onDismiss() {
    // Check subscription status after dismissal
    locator<SubscriptionCubit>().checkSubscriptionStatus();

    // Navigate back or to main screen
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      // If this is the root page, navigate to home
      context.go('/');
    }
  }
}
