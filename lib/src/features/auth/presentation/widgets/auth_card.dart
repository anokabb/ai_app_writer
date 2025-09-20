import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phrasly_ai_tools/src/core/components/forms/app_text_form_field.dart';
import 'package:phrasly_ai_tools/src/core/components/layouts/buttons/gradient_button.dart';
import 'package:phrasly_ai_tools/src/core/components/widgets/app_card.dart';
import 'package:phrasly_ai_tools/src/core/extensions/context_extension.dart';
import 'package:phrasly_ai_tools/src/core/services/locator/locator.dart';
import 'package:phrasly_ai_tools/src/core/services/theme/app_theme.dart';
import 'package:phrasly_ai_tools/src/core/utils/utils.dart';
import 'package:phrasly_ai_tools/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:phrasly_ai_tools/src/features/home/presentation/pages/home_page.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({super.key});

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  bool isLogin = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthStateError) {
          showTopError(state.error.message);
        }
      },
      builder: (context, state) {
        if (state is AuthStateAuthenticated) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: AppCard(
            radius: 10,
            child: Form(
              key: _formKey,
              child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutCubic,
                child: Column(
                  spacing: 16,
                  children: [
                    Row(
                      children: <Widget>[
                        Icon(
                          isLogin ? Icons.login_outlined : Icons.app_registration_outlined,
                          color: context.appColors.primary,
                        ),
                        SizedBox(width: 10),
                        Text(
                          isLogin ? 'Sign In' : 'Sign Up',
                          style: context.appTextTheme.subtitle2,
                        ),
                      ],
                    ),
                    if (!isLogin)
                      AppTextFormField(
                        controller: _nameController,
                        isMultiline: false,
                        hintText: 'Full Name',
                        inputType: InputType.text,
                      ),
                    AppTextFormField(
                      controller: _emailController,
                      isMultiline: false,
                      hintText: 'Email Address',
                      inputType: InputType.email,
                    ),
                    Column(
                      children: [
                        AppTextFormField(
                          controller: _passwordController,
                          isMultiline: false,
                          hintText: 'Password',
                          inputType: InputType.password,
                        ),
                        if (!isLogin)
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: AppTextFormField(
                              controller: _confirmPasswordController,
                              isMultiline: false,
                              hintText: 'Confirm Password',
                              inputType: InputType.password,
                              parentMatchController: _passwordController,
                            ),
                          ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: _toggleAuthMode,
                            style: TextButton.styleFrom(
                              textStyle: context.appTextTheme.subtitle3.copyWith(
                                color: context.theme.appColors.primary,
                              ),
                            ),
                            child: Text(isLogin ? 'Register' : 'Login'),
                          ),
                        ),
                      ],
                    ),
                    GradientButton(
                      isAsync: true,
                      onPressed: _submit,
                      gradientColors: [
                        Utils.hexToColor('#0A7ADF'),
                        Utils.hexToColor('#035093'),
                      ],
                      label: isLogin ? 'Login' : 'Register',
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   spacing: 16,
                    //   children: [
                    //     AppCupertinoButton(
                    //       onTap: () {},
                    //       child: Container(
                    //         padding: const EdgeInsets.all(8),
                    //         decoration: BoxDecoration(
                    //           color: context.theme.appColors.background,
                    //           border: Border.all(
                    //             color: context.theme.appColors.borderColor,
                    //           ),
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         child: Icon(
                    //           FontAwesomeIcons.apple,
                    //           color: Utils.hexToColor('#1A5DAB'),
                    //           size: 30,
                    //         ),
                    //       ),
                    //     ),
                    //     AppCupertinoButton(
                    //       onTap: locator<AuthCubit>().signInWithGoogle,
                    //       child: Container(
                    //         padding: const EdgeInsets.all(8),
                    //         decoration: BoxDecoration(
                    //           color: context.theme.appColors.background,
                    //           border: Border.all(
                    //             color: context.theme.appColors.borderColor,
                    //           ),
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         child: Icon(
                    //           FontAwesomeIcons.google,
                    //           color: Utils.hexToColor('#1A5DAB'),
                    //           size: 30,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (isLogin) {
        await locator<AuthCubit>().login(_emailController.text, _passwordController.text);
      } else {
        await locator<AuthCubit>()
            .register(_nameController.text.trim(), _emailController.text, _passwordController.text);
      }

      if (FirebaseAuth.instance.currentUser != null) {
        context.go(HomePage.routeName);
      }
    }
  }

  void _toggleAuthMode() {
    setState(() {
      isLogin = !isLogin;
    });
  }
}
