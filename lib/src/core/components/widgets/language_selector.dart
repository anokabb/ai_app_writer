import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:flutter_app_template/src/core/components/pop_up/slide_up_pop_up.dart';
import 'package:flutter_app_template/src/core/components/widgets/app_card.dart';
import 'package:flutter_app_template/src/core/gen/assets.gen.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LanguageModel {
  final String name;
  final String flag;
  LanguageModel({required this.name, required this.flag});
}

List<LanguageModel> languages = [
  LanguageModel(name: 'English', flag: '🇺🇸'),
  LanguageModel(name: 'French', flag: '🇫🇷'),
  LanguageModel(name: 'Spanish', flag: '🇪🇸'),
  LanguageModel(name: 'German', flag: '🇩🇪'),
  LanguageModel(name: 'Chinese', flag: '🇨🇳'),
  LanguageModel(name: 'Russian', flag: '🇷🇺'),
  LanguageModel(name: 'Korean', flag: '🇰🇷'),
  LanguageModel(name: 'Arabic', flag: '🇸🇦'),
];

class LanguageSelector extends StatelessWidget {
  final List<Color> gradientColors;
  final LanguageModel selectedLang;
  final void Function(LanguageModel? lang) onSelected;

  const LanguageSelector({
    super.key,
    required this.gradientColors,
    required this.selectedLang,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      customChild: Row(
        children: <Widget>[
          Text(
            selectedLang.flag,
            style: context.appTextTheme.body1,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              selectedLang.name,
              style: context.appTextTheme.subtitle2.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Icon(
            FontAwesomeIcons.caretDown,
            color: Colors.white,
          ),
        ],
      ),
      borderRadius: 8,
      padding: EdgeInsets.all(10),
      ignoreHeight: true,
      onPressed: () => _showLanguageSelector(context),
      hasShadow: true,
      textStyle: context.appTextTheme.subtitle3.copyWith(
        color: Colors.white,
      ),
      gradientColors: gradientColors,
    );
  }

  Future<void> _showLanguageSelector(BuildContext context) async {
    final result = await SlideUpPopUp.show<String>(
      context: context,
      child: _LanguageSelectorContent(
        selectedLang: selectedLang.name,
        gradientColors: gradientColors,
        onSelected: (language) {
          Navigator.of(context).pop(language);
        },
      ),
    );

    if (result != null) {
      onSelected(languages.firstWhereOrNull((language) => language.name == result));
    }
  }
}

class _LanguageSelectorContent extends StatelessWidget {
  final String selectedLang;
  final void Function(String) onSelected;
  final List<Color> gradientColors;

  const _LanguageSelectorContent({
    required this.selectedLang,
    required this.onSelected,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: 'Select Language',
      icon: SvgPicture.asset(
        Assets.svg.globe,
        colorFilter: ColorFilter.mode(gradientColors.first, BlendMode.srcIn),
        width: 24,
        height: 24,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          // Language list
          ...languages.map((language) => _LanguageItem(
                language: language,
                isSelected: language.name == selectedLang,
                onTap: () => onSelected(language.name),
                gradientColors: gradientColors,
              )),
        ],
      ),
    );
  }
}

class _LanguageItem extends StatefulWidget {
  final LanguageModel language;
  final bool isSelected;
  final VoidCallback onTap;
  final List<Color> gradientColors;

  const _LanguageItem({
    required this.language,
    required this.isSelected,
    required this.onTap,
    required this.gradientColors,
  });

  @override
  State<_LanguageItem> createState() => _LanguageItemState();
}

class _LanguageItemState extends State<_LanguageItem> {
  @override
  Widget build(BuildContext context) {
    return AppCupertinoButton(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          gradient: widget.isSelected
              ? LinearGradient(colors: [
                  widget.gradientColors.last.withOpacity(0.2),
                  widget.gradientColors.first.withOpacity(0.1),
                ])
              : null,
          borderRadius: BorderRadius.circular(8),
          border: widget.isSelected ? Border.all(color: widget.gradientColors.first) : null,
        ),
        child: Row(
          children: [
            Text(
              widget.language.flag,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.language.name,
                style: context.appTextTheme.subtitle1.copyWith(
                  fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.normal,
                  color: widget.isSelected ? widget.gradientColors.first : null,
                ),
              ),
            ),
            if (widget.isSelected)
              Icon(
                Icons.check_circle,
                color: widget.gradientColors.first,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
