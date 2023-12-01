import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/app/app.dart';


class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final String errorText = '';

  bool obscure = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final currentFocus = FocusScope.of(context);
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
          Text(
            errorText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
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
              keyboardType:TextInputType.name,
              controller: email,
              labelText: 'janedoe@gmail.com',
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              prefixIcon: IconButton(
                onPressed: () {  },
                icon: SvgPicture.asset(AppImage.userTag, width: 16,),
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
              inputFormatters: [
                LengthLimitingTextInputFormatter(8),
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              prefixIcon: IconButton(
                onPressed: () {  },
                icon: SvgPicture.asset(AppImage.lock, width: 16,),
              ),
              suffixIcon:
              IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: obscure
                    ?SvgPicture.asset(AppImage.eyeSlash, width: 16,)
                    :SvgPicture.asset(AppImage.eyeSlash, width: 16,),
                color: Colors.grey,
                iconSize: 19,
              ),
              onChanged: (val){
                if(val.length == 8){
                  if(currentFocus.hasPrimaryFocus){
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
                        fontSize: 12,),
                  ),
                ),
              ),
            ],
          ),
           Space(32.h),
          ElevatedButton(
              onPressed: (){
                //ref.read(connectionProvider);
                // if(_formKey.currentState!.validate()){
                //   if (!currentFocus.hasPrimaryFocus){
                //     currentFocus.unfocus();
                //   }
                // }
                context.goNamed(AppRoute.home.name);
              },
              child: Text('Login', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),),
          ),
           Space(37.h),
          Row(
            children: [
              Container(height: 1, width: 111.w,color: const Color(0xFFa6a6a7),),
              const Space(10),
              Text('Or continue with', style: Theme.of(context).textTheme.bodyMedium,),
              const Space(10),
              Container(height: 1, width: 111.w,color: const Color(0xFFa6a6a7),),
            ],
          ),
          Space(37.h),
          const AuthOptionButton(loading: false,),
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
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffb42c3a),
                      ),),
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
