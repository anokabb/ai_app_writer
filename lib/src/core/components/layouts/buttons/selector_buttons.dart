import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:phrasly_ai_tools/src/core/extensions/extensions.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';

class SelectorButtons extends StatelessWidget {
  final List<String> items;
  final Function(String) onSelected;
  final List<Color> colors;
  final String? selectedItem;

  const SelectorButtons({
    super.key,
    required this.items,
    required this.onSelected,
    required this.colors,
    this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items.map((e) {
        final isSelected = e == selectedItem;
        return Opacity(
          opacity: isSelected ? 1 : 0.5,
          child: AppCupertinoButton(
            onTap: () {
              onSelected(e);
            },
            child: Container(
              width: 90,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: colors),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 6,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Center(
                child: AutoSizeText(
                  e.capitalizeFirst,
                  maxLines: 1,
                  style: context.appTextTheme.subtitle2.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
