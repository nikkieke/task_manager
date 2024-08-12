import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/auth/auth.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  bool obscure = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentFocus = FocusScope.of(context);

    // ref
    //   ..listen<AsyncValue<NewUser>>(socialSignInProvider, (_, state) {
    //     return state.whenOrNull(
    //       error: (error, stackTrace) {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(content: Text('$error')),
    //         );
    //       },
    //     );
    //   })
    //   ..listen<AsyncValue<NewUser>>(logInProvider, (_, state) {
    //     return state.whenOrNull(
    //       error: (error, stackTrace) {
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           SnackBar(content: Text('$error')),
    //         );
    //       },
    //     );
    //   });

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
      ..listen<AsyncValue<NewUser>>(logInProvider, (_, value) {
        if (value is AsyncData<NewUser>) {
          context.pushNamed(
            AppRoute.home.name,
          );
          // email.clear();
          // password.clear();
        }
        if (value is AsyncError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${value.error}')),
          );
        }
      });

    //loading state
    final socialSignInState = ref.watch(socialSignInProvider);
    final isSocialLoading = socialSignInState is AsyncLoading<void>;

    final signInState = ref.watch(logInProvider);
    final isLoading = signInState is AsyncLoading<void>;

    return Form(
      key: _formKey,
      child: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back!',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
          ),
          Space(34.h),
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
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              validator: validateEmail,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  context.pushNamed(AppRoute.forgotPassword.name);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                  shape: const StadiumBorder(),
                  padding: EdgeInsets.zero,
                ),
                child: Center(
                  child: Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12,
                        ),
                  ),
                ),
              ),
            ],
          ),
          Space(32.h),
          MainButton(
            loading: isLoading,
            text: 'Login',
            pressed: () {
              ref.read(connectionProvider);
              if (_formKey.currentState!.validate()) {
                ref.read(logInProvider.notifier).signIn(
                      email.text,
                      password.text,
                    );
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
              ref.read(socialSignInProvider.notifier).socialSignIn(
                    SocialLogIn.google,
                  );
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
              context.pushNamed(AppRoute.signup.name);
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
                      text: ' Sign up',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
    );
  }
}
