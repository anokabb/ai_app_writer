import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/default_layout.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/extensions/extensions.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/features/languages/presentation/cubit/language_cubit.dart';

enum AppLanguageEnum {
  ar,
  en,
}

List<(String, String)> app_languages = [
  ('العربية', AppLanguageEnum.ar.name),
  ('English', AppLanguageEnum.en.name),
];

class LanguagePage extends StatefulWidget {
  static const String routeName = '/language';

  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale?>(
      builder: (context, state) {
        return DefaultLayout(
          title: context.localization.languages,
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: app_languages.length + 1,
            itemBuilder: (context, index) {
              if (index == app_languages.length) {
                return SizedBox();
              }
              return ListTile(
                title: Text(
                  app_languages[index].$1.capitalizeFirst,
                  style: context.theme.appTextTheme.body1,
                ),
                onTap: () async {
                  await context.read<LanguageCubit>().updateLanguage(Locale(app_languages[index].$2));
                  Future.delayed(const Duration(milliseconds: 200), () {
                    context.pop();
                  });
                },
                trailing: state?.languageCode == app_languages[index].$2
                    ? Icon(
                        Icons.check_circle_rounded,
                        color: context.theme.appColors.onBackground,
                      )
                    : null,
              );
            },
          ),
        );
      },
    );
  }
}
