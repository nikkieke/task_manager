import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/app/app.dart';

class AuthOptionButton extends StatelessWidget {
  const AuthOptionButton({
    required this.googlePressed,
    required this.applePressed,
    required this.loading, super.key,
  });

  final bool loading;
  final VoidCallback applePressed;
  final VoidCallback googlePressed;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS?
    OutlinedButton(
      onPressed: applePressed,
      child: loading?
      const LoadingIndicator(color: Colors.white,):
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
      ),
    ):
      OutlinedButton(
        onPressed: googlePressed,
        child: loading?
        const LoadingIndicator(color: Colors.white,):
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

class MainButton extends StatelessWidget {
  const MainButton({required this.loading, required this.text, required this.pressed, super.key});

  final bool loading;
  final String text;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        onPressed: pressed,
        child: loading?
        const LoadingIndicator(color: Colors.white,):
        Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),),
    );
  }
}

