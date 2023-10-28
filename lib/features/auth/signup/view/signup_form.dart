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
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
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
              obscureText: true,
              labelText: '********',
              inputFormatters: [
                LengthLimitingTextInputFormatter(8),
                FilteringTextInputFormatter.deny(RegExp('[ ]')),
              ],
              suffixIcon:
              IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: obscure
                    ?SvgPicture.asset(AppImage.eyeSlash)
                    :SvgPicture.asset(AppImage.eyeSlash),
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
          Space(32.h),
          ElevatedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
                if (!currentFocus.hasPrimaryFocus){
                  currentFocus.unfocus();
                }
              }
            },
            child: Text('Signup', style: Theme.of(context).textTheme.bodyMedium,),
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
          OutlinedButton(
            onPressed: (){},
            child: Text('Google', style: Theme.of(context).textTheme.bodyMedium,),),
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
