import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/home/presentation//widgets/widgets.dart';

class CompletedProjectsCard extends StatelessWidget {
  const CompletedProjectsCard({
    required this.model,
    super.key,
  });

  final CompletedProjects model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (context.mounted) {
          context.pushNamed(AppRoute.projectDetails.name);
        }
      },
      child: Container(
        width: 183.w,
        padding: EdgeInsets.only(left: 10.r, right: 8.r, top: 5.r),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Text(
              model.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white, fontSize: 23.sp),
            ),
            Row(
              children: [
                Text(
                  'Team members',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 13.sp,
                      ),
                ),
                Space(4.h),
                SizedBox(
                  width: 60.w,
                  child: Stack(
                    children: [
                      SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(model.teamAvatar[0])),
                      Positioned(
                        left: 10.w,
                        top: 0,
                        bottom: 0,
                        child: SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: Image.asset(model.teamAvatar[1])),
                      ),
                      Positioned(
                        left: 20.w,
                        top: 0,
                        bottom: 0,
                        child: SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: Image.asset(model.teamAvatar[2])),
                      ),
                      Positioned(
                        left: 30.w,
                        top: 0,
                        bottom: 0,
                        child: SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: Image.asset(model.teamAvatar[3])),
                      ),
                      Positioned(
                        left: 40.w,
                        top: 0,
                        bottom: 0,
                        child: SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: Image.asset(model.teamAvatar[4])),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Space(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Completed',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 13.sp,
                      ),
                ),
                Text(
                  '100%',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp,
                      ),
                ),
              ],
            ),
            Space(2.h),
            const LineIndicator(
              percent: 1,
            ),
          ],
        ),
      ),
    );
  }
}
