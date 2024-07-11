import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/auth/auth.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  bool obscure = true;
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    fullName.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void handleSignUp() {
    ref.read(signUpProvider.notifier).signUp(
          email.text,
          password.text,
          fullName.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final currentFocus = FocusScope.of(context);

    //listen for errors
    ref
      ..listen<AsyncValue<NewUser>>(socialSignInProvider, (_, value) {
        if (value is AsyncData<NewUser>) {
          context.pushNamed(
            AppRoute.home.name,
          );
        }
        if (value is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${value.error}')),
          );
        }
      })
      ..listen<AsyncValue<NewUser>>(signUpProvider, (_, value) {
        if (value is AsyncData<NewUser>) {
          context.pushNamed(
            AppRoute.verifyEmail.name,
          );
        }
        if (value is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${value.error}')),
          );
        }
      });

    //loading state
    final signUpState = ref.watch(signUpProvider);
    final isLoading = signUpState is AsyncLoading<void>;

    final socialSignInState = ref.watch(socialSignInProvider);
    final isSocialLoading = socialSignInState is AsyncLoading<void>;

    return Form(
      key: _formKey,
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create your account',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
              ),
              Space(24.h),
              Text(
                'Full Name',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Container(
                alignment: Alignment.center,
                height: 58,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff1f1f1f),
                ),
                child: TextFormInput(
                  keyboardType: TextInputType.name,
                  controller: fullName,
                  labelText: 'Jane Doe',
                  validator: validateName,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^[a-zA-Z ]*$'),
                    ),
                  ],
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppImage.user,
                      width: 16,
                    ),
                  ),
                ),
              ),
              const Space(8),
              Text(
                'Email Address',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Container(
                alignment: Alignment.center,
                height: 58,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff1f1f1f),
                ),
                child: TextFormInput(
                  keyboardType: TextInputType.name,
                  controller: email,
                  labelText: 'janedoe@gmail.com',
                  validator: validateEmail,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[ ]')),
                  ],
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppImage.userTag,
                      width: 16,
                    ),
                  ),
                ),
              ),
              const Space(8),
              Text(
                'Password',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Container(
                alignment: Alignment.center,
                height: 58,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff1f1f1f),
                ),
                child: TextFormInput(
                  key: const Key('loginForm_passwordInput_textField'),
                  controller: password,
                  obscureText: obscure,
                  labelText: '********',
                  validator: validatePassword,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(8),
                    FilteringTextInputFormatter.deny(RegExp('[ ]')),
                  ],
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppImage.lock,
                      width: 16,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    icon: obscure
                        ? SvgPicture.asset(
                            AppImage.eyeSlash,
                            width: 16,
                          )
                        : SvgPicture.asset(
                            AppImage.eyeSlash,
                            width: 16,
                          ),
                    color: Colors.grey,
                    iconSize: 19,
                  ),
                  onChanged: (val) {
                    if (val.length == 8) {
                      if (currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    }
                  },
                ),
              ),
              Space(15.h),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: EdgeInsets.zero,
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: RichText(
                    selectionColor: Theme.of(context).primaryColor,
                    text: TextSpan(
                      text: 'By clicking ‘Signup’ you agree to',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: ' TaskManager ',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //print('Tap Here onTap');
                            },
                          text: 'Terms of Use',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //print('Tap Here onTap');
                            },
                          text: 'Privacy Policy',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Space(32.h),
              MainButton(
                loading: isLoading,
                text: 'Signup',
                pressed: () {
                  if (_formKey.currentState!.validate()) {
                    handleSignUp();
                    // if (!currentFocus.hasPrimaryFocus){
                    //   currentFocus.unfocus();
                    // }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Fill all required data correctly')),
                    );
                  }
                },
              ),
              Space(37.h),
              Row(
                children: [
                  Container(
                    height: 1,
                    width: 111.w,
                    color: const Color(0xFFa6a6a7),
                  ),
                  const Space(10),
                  Text(
                    'Or continue with',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Space(10),
                  Container(
                    height: 1,
                    width: 111.w,
                    color: const Color(0xFFa6a6a7),
                  ),
                ],
              ),
              Space(37.h),
              AuthOptionButton(
                loading: isSocialLoading,
                googlePressed: () {
                  ref
                      .read(socialSignInProvider.notifier)
                      .socialSignIn(SocialLogIn.google);
                },
                applePressed: () {
                  ref
                      .read(socialSignInProvider.notifier)
                      .socialSignIn(SocialLogIn.apple);
                },
              ),
              Space(10.h),
              TextButton(
                onPressed: () {
                  context.pushNamed(AppRoute.login.name);
                },
                style: TextButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: EdgeInsets.zero,
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: RichText(
                    selectionColor: Theme.of(context).primaryColor,
                    text: TextSpan(
                      text: 'Don’t have an account?',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Log in',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xffb42c3a),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
