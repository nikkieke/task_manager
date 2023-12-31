import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/app/app.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  bool obscure = true;
  final TextEditingController fullName = TextEditingController();
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
              keyboardType:TextInputType.name,
              controller: fullName,
              labelText: 'jane doe',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z ]*$'),),
              ],
              prefixIcon: IconButton(
                onPressed: () {  },
                icon: SvgPicture.asset(AppImage.user, width: 16,),
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
          Space(15.h),
          TextButton(
            onPressed: () {

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
                  text: 'By clicking ‘Signup’ you agree to',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: <TextSpan>[
                    TextSpan(
                      text: ' TaskManager ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                        fontWeight: FontWeight.w600,),),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //print('Tap Here onTap');
                        },
                      text: 'Terms of Use',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,),),
                    TextSpan(
                      text: ' and ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                        fontWeight: FontWeight.w600,),),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //print('Tap Here onTap');
                        },
                      text: 'Privacy Policy',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,),),
                  ],
                ),
              ),
            ),
          ),
          Space(32.h),
          ElevatedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
                if (!currentFocus.hasPrimaryFocus){
                  currentFocus.unfocus();
                }
              }
            },
            child: Text('Signup', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),),
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
