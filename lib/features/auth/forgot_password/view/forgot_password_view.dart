import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/app/app.dart';


class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentFocus = FocusScope.of(context);

    final formKey = GlobalKey<FormState>();
    final email = TextEditingController();

    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  Text(
                    'Reset Password',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Space(24.h),
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
                  Space(32.h),
                  ElevatedButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        if (!currentFocus.hasPrimaryFocus){
                          currentFocus.unfocus();
                        }
                      }
                    },
                    child: Text('Continue', style: Theme.of(context).textTheme.bodyMedium,),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
