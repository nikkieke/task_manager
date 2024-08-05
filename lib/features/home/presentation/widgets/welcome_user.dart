import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/features/features.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({
    required this.user,
    required this.userX,
    super.key,
  });

  final Either<ErrorHandler, NewUser> user;
  final AsyncValue<NewUser> userX;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontSize: 13.sp,
                  ),
            ),
            if (user.right.fullName != null && user.isRight) ...[
              Text(
                '${user.right.fullName}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ] else ...[
              if (userX.value == null) ...[
                userNameLoading(),
              ] else ...[
                Text(
                  '${userX.value?.fullName}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ],
          ],
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(AppRoute.profile.name);
          },
          child: SizedBox(
            width: 47.w,
            height: 48.h,
            child: Image.asset(AppImage.avatar1),
          ),
        ),
      ],
    );
  }
}
