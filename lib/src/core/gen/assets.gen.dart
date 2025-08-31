// dart format width=150

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ai_detector.png
  AssetGenImage get aiDetector => const AssetGenImage('assets/images/ai_detector.png');

  /// File path: assets/images/ai_humanizer.png
  AssetGenImage get aiHumanizer => const AssetGenImage('assets/images/ai_humanizer.png');

  /// File path: assets/images/app_icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/images/app_icon.png');

  /// File path: assets/images/app_icon_android_12.png
  AssetGenImage get appIconAndroid12 => const AssetGenImage('assets/images/app_icon_android_12.png');

  /// File path: assets/images/content_generator.png
  AssetGenImage get contentGenerator => const AssetGenImage('assets/images/content_generator.png');

  /// List of all assets
  List<AssetGenImage> get values => [aiDetector, aiHumanizer, appIcon, appIconAndroid12, contentGenerator];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/ai_magic.svg
  String get aiMagic => 'assets/svg/ai_magic.svg';

  /// File path: assets/svg/ai_stars.svg
  String get aiStars => 'assets/svg/ai_stars.svg';

  /// File path: assets/svg/arrow_right_opacity.svg
  String get arrowRightOpacity => 'assets/svg/arrow_right_opacity.svg';

  /// File path: assets/svg/clear.svg
  String get clear => 'assets/svg/clear.svg';

  /// File path: assets/svg/clock.svg
  String get clock => 'assets/svg/clock.svg';

  /// File path: assets/svg/copy_orange.svg
  String get copyOrange => 'assets/svg/copy_orange.svg';

  /// File path: assets/svg/docs.svg
  String get docs => 'assets/svg/docs.svg';

  /// File path: assets/svg/globe.svg
  String get globe => 'assets/svg/globe.svg';

  /// File path: assets/svg/home.svg
  String get home => 'assets/svg/home.svg';

  /// File path: assets/svg/link.svg
  String get link => 'assets/svg/link.svg';

  /// File path: assets/svg/profile.svg
  String get profile => 'assets/svg/profile.svg';

  /// File path: assets/svg/settings_orange.svg
  String get settingsOrange => 'assets/svg/settings_orange.svg';

  /// File path: assets/svg/sliders.svg
  String get sliders => 'assets/svg/sliders.svg';

  /// File path: assets/svg/stats_orange.svg
  String get statsOrange => 'assets/svg/stats_orange.svg';

  /// File path: assets/svg/tab_home.svg
  String get tabHome => 'assets/svg/tab_home.svg';

  /// File path: assets/svg/taj.svg
  String get taj => 'assets/svg/taj.svg';

  /// List of all assets
  List<String> get values => [
        aiMagic,
        aiStars,
        arrowRightOpacity,
        clear,
        clock,
        copyOrange,
        docs,
        globe,
        home,
        link,
        profile,
        settingsOrange,
        sliders,
        statsOrange,
        tabHome,
        taj
      ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const String staging = 'staging.env';

  /// List of all assets
  static List<String> get values => [staging];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
