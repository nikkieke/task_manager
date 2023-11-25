import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/app/app.dart';

class AuthOptionButton extends StatelessWidget {
  const AuthOptionButton({
    required this.loading, super.key,
  });

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){},
      child: loading?
      const LoadingIndicator(color: Colors.white,):
      Platform.isIOS?
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImage.apple,
            width: 20,
            colorFilter: const ColorFilter.mode(
              Color(0xFFa6a6a7),
              BlendMode.srcIn,
            ),),
          Space(10.w),
          Text('Apple', style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ):
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImage.google,
            width: 20,
            colorFilter: const ColorFilter.mode(
              Color(0xFFa6a6a7),
              BlendMode.srcIn,
            ),),
          Space(10.w),
          Text('Google', style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
