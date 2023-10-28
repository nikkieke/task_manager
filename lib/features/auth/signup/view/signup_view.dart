import 'package:flutter/material.dart';
import 'package:task_manager/features/auth/signup/signup.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignupForm(),
            ],
          ),
        ),
      ),
    );
  }
}
