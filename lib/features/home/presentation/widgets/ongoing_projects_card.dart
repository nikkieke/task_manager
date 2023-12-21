import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/home/presentation/widgets/widgets.dart';


class OngoingProjectsCard extends StatelessWidget {
  const OngoingProjectsCard({
    required this.model,
    super.key,
  });

  final OngoingProjects model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(context.mounted){
          context.pushNamed(AppRoute.projectDetails.name);
        }
      },
      child: Container(
        //height: 125.h,
        width: 384.w,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: const BoxDecoration(
          color: Color(0xff1b1b1b),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Team members',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 13.sp,),
                    ),
                    Space(5.h),
                    SizedBox(
                      width: 60.w,
                      child: Stack(
                        children: [
                          SizedBox(width: 20.w, height: 20.h, child: Image.asset(model.teamAvatars[0])),
                          Positioned(
                            left: 10.w,
                            top: 0,
                            bottom: 0,
                            child: SizedBox(width: 20.w, height: 20.h, child: Image.asset(model.teamAvatars[1])),),
                          Positioned(
                            left: 20.w,
                            top: 0,
                            bottom: 0,
                            child: SizedBox(width: 20.w, height: 20.h, child: Image.asset(model.teamAvatars[2])),),
                        ],
                      ),
                    ),
                    Space(5.h),
                    Text(
                      'Due on : ${model.dueDate}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 13.sp,),
                    ),
                  ],
                ),
                CircleIndicator(percent: model.percent,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
