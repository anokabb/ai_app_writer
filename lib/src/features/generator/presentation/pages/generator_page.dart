import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/src/core/components/forms/main_text_field.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_cuppertino_button.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:flutter_app_template/src/core/components/layouts/gradient_layout.dart';
import 'package:flutter_app_template/src/core/components/widgets/app_card.dart';
import 'package:flutter_app_template/src/core/components/widgets/language_selector.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/extensions/extensions.dart';
import 'package:flutter_app_template/src/core/gen/assets.gen.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_app_template/src/features/generator/data/repos/generator_repo.dart';
import 'package:flutter_app_template/src/features/generator/presentation/cubit/generator_cubit.dart';
import 'package:flutter_app_template/src/features/generator/presentation/pages/generator_result_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

enum TypeOfWriting { paper, letter, email, story, blog, discussion_board }

enum Tone { formal, neutral, conversational, creative }

String typeOfWritingSubtitle(String typeOfWriting) {
  switch (typeOfWriting) {
    case 'paper':
      return 'Scholarly Work';
    case 'letter':
      return 'Personal Note';
    case 'email':
      return 'Digital Message';
    case 'story':
      return 'Creative Tale';
    case 'blog':
      return 'Online Post';
    case 'discussion_board':
      return 'Forum Entry';
    default:
      return 'Written Work';
  }
}

class GeneratorPage extends StatefulWidget {
  static List<Color> colors = [
    Utils.hexToColor('#0779DF'),
    Utils.hexToColor('#055396'),
  ];

  const GeneratorPage({super.key});

  static const routeName = '/generator';

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  final GeneratorCubit generatorCubit = GeneratorCubit(locator<GeneratorRepo>());
  final Color primaryColor = Utils.hexToColor('#2171D0');
  bool isLoading = false;
  final TextEditingController _textController = TextEditingController();

  int wordCount = 500;
  final TextEditingController _wordCountController = TextEditingController(text: '500');

  final _formKey = GlobalKey<FormState>();
  final scrollController = ScrollController();

  TypeOfWriting typeOfWriting = TypeOfWriting.paper;
  Tone tone = Tone.formal;
  LanguageModel selectedLang = languages.first;

  @override
  void dispose() {
    scrollController.dispose();
    _textController.dispose();
    _wordCountController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  final resultKey = GlobalKey();

  void scrollToDetectorResult() {
    // Scrolls to the detector result widget to make sure it's visible
    final context = resultKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: 0.1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => generatorCubit,
      child: GradientLayout(
        title: 'Content Generator',
        colors: GeneratorPage.colors,
        child: ListView(
          controller: scrollController,
          padding: context.scrollSafePadding,
          children: [
            AppCard(
              radius: 10,
              title: 'What would you like to write about?',
              icon: SvgPicture.asset(
                Assets.svg.light,
              ),
              child: Column(
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: MainTextField(
                      controller: _textController,
                      primaryColor: primaryColor,
                      height: 140,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            AppCard(
              radius: 10,
              title: 'Type of writing',
              icon: SvgPicture.asset(
                Assets.svg.docs,
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: TypeOfWriting.values.length,
                  itemBuilder: (context, index) {
                    bool isSelected = typeOfWriting == TypeOfWriting.values[index];

                    Color textColor = isSelected ? Colors.white : Colors.black;

                    return GradientButton(
                      onPressed: () {
                        setState(() {
                          typeOfWriting = TypeOfWriting.values[index];
                        });
                      },
                      padding: EdgeInsets.all(8),
                      height: 100,
                      borderRadius: 8,
                      forceButtonColor: !isSelected ? Colors.white : null,
                      customChild: Column(
                        spacing: 4,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AutoSizeText(
                            TypeOfWriting.values[index].name.enumCapitalize(),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: context.appTextTheme.subtitle3.copyWith(
                              color: textColor,
                            ),
                            minFontSize: 4,
                          ),
                          Text(
                            typeOfWritingSubtitle(TypeOfWriting.values[index].name),
                            style: context.appTextTheme.body3.copyWith(
                              color: textColor,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                      gradientColors: [
                        Utils.hexToColor('#1486ED'),
                        Utils.hexToColor('#60B2FB'),
                      ],
                      gradientBegin: Alignment.topLeft,
                      gradientEnd: Alignment.bottomRight,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            AppCard(
              radius: 10,
              title: 'Tone',
              icon: SvgPicture.asset(
                Assets.svg.sliders,
                colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
              titlePadding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 6),
                  SizedBox(
                    height: 24 + 14,
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: Tone.values.length,
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        bool isSelected = tone == Tone.values[index];
                        Color textColor = isSelected ? Colors.white : primaryColor;

                        return GradientButton(
                          expand: false,
                          borderRadius: 500,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          forceButtonColor: !isSelected ? Colors.white : null,
                          height: 24,
                          onPressed: () {
                            setState(() {
                              tone = Tone.values[index];
                            });
                          },
                          gradientColors: [
                            Utils.hexToColor('#258EEC'),
                            Utils.hexToColor('#1D6DB4'),
                          ],
                          gradientBegin: Alignment.topLeft,
                          gradientEnd: Alignment.bottomRight,
                          customChild: Center(
                            child: Text(
                              Tone.values[index].name.enumCapitalize(),
                              style: context.appTextTheme.subtitle3.copyWith(
                                color: textColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          spacing: 8,
                          children: <Widget>[
                            SvgPicture.asset(
                              Assets.svg.hashtag,
                            ),
                            Text(
                              'Word Count',
                              style: context.appTextTheme.subtitle2,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 16, 0),
                          decoration: BoxDecoration(
                            color: Utils.hexToColor('#F0F0F7'),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 45,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _wordCountController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  onChanged: (value) {
                                    wordCount = int.tryParse(value) ?? wordCount;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    fillColor: Colors.transparent,
                                  ),
                                  style: context.appTextTheme.subtitle1.copyWith(
                                    color: Utils.hexToColor('#258EEC'),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    height: 1,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Utils.hexToColor('#DFDFE3'),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppCupertinoButton(
                                        child: SizedBox(
                                          height: 40,
                                          width: 34,
                                          child: Icon(
                                            Icons.remove,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        onTap: () {
                                          if (wordCount > 1) wordCount--;
                                          _wordCountController.text = wordCount.toString();
                                        },
                                      ),
                                      Container(
                                        height: 20,
                                        width: 1.5,
                                        color: Utils.hexToColor('#CDCDD2'),
                                      ),
                                      AppCupertinoButton(
                                        child: SizedBox(
                                          height: 40,
                                          width: 34,
                                          child: Icon(
                                            Icons.add,
                                            size: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        onTap: () {
                                          wordCount++;
                                          _wordCountController.text = wordCount.toString();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            AppCard(
              title: 'Language',
              icon: SvgPicture.asset(
                Assets.svg.globe,
                colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
              ),
              child: LanguageSelector(
                gradientColors: [
                  Utils.hexToColor('#1486ED'),
                  Utils.hexToColor('#60B2FB'),
                ],
                selectedLang: selectedLang,
                onSelected: (lang) {
                  if (lang == null) return;
                  setState(() {
                    selectedLang = lang;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            BlocBuilder<GeneratorCubit, GeneratorState>(
              builder: (context, state) {
                return GradientButton(
                  label: 'Generate Magic',
                  icon: SvgPicture.asset(
                    Assets.svg.aiMagic,
                    colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  gradientColors: [
                    Utils.hexToColor('#258EEC'),
                    Utils.hexToColor('#1D6DB4'),
                  ],
                  isAsync: true,
                  onPressed: generateContent,
                );
              },
            ),
            SizedBox(height: 20),
            GeneratorResultWidget(
              key: resultKey,
              color: primaryColor,
              gradientColors: [
                Utils.hexToColor('#258EEC'),
                Utils.hexToColor('#1D6DB4'),
              ],
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> generateContent() async {
    setState(() {
      isLoading = true;
    });

    if (_formKey.currentState?.validate() ?? false) {
      await generatorCubit.generateContent(
        text: _textController.text,
        typeOfWriting: typeOfWriting.name,
        tone: tone.name,
        wordCount: wordCount,
        language: selectedLang.name,
        onFirstLoad: () {
          Future.delayed(const Duration(milliseconds: 100), () {
            scrollToDetectorResult();
          });
        },
      );

      Future.delayed(const Duration(milliseconds: 100), () {
        scrollToDetectorResult();
      });
    }

    setState(() {
      isLoading = false;
    });
  }
}
