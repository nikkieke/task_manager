import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/features/features.dart';

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({
    super.key,
    required this.user,
    required this.userX,
  });

  final AsyncValue<Either<ErrorHandler, NewUser>> user;
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
            user.maybeWhen(
              data: (data) {
                if (data.isRight) {
                  return Text(
                    '${data.right.fullName}',
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                } else {
                  print(data.left);
                  //return Text('nothing');
                  if (userX.value == null) {
                    return userNameLoading();
                  } else {
                    return Text(
                      '${userX.value?.fullName}',
                      style: Theme.of(context).textTheme.titleLarge,
                    );
                  }
                }
              },
              orElse: userNameLoading,
            ),
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
