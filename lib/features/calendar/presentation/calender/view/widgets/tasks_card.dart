import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/features/calendar/presentation/calender/view/widgets/widgets.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.model,
    super.key,
  });
  final Tasks model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 72.h,
          width: 20.w,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Container(
          width: 350.w,
          height: 72.h,
          padding:  EdgeInsets.all(10.r,),
          decoration: const BoxDecoration(
            color: Color(0xff1b1b1b),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.title),
                  Text(model.time,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 60.w,
                child: Stack(
                  children: [
                    SizedBox(width: 20.w, height: 20.h, child: Image.asset(model.teamAvatar[0])),
                    Positioned(
                      left: 10.w,
                      top: 0,
                      bottom: 0,
                      child: SizedBox(width: 20.w, height: 20.h, child: Image.asset(model.teamAvatar[1])),),
                    Positioned(
                      left: 20.w,
                      top: 0,
                      bottom: 0,
                      child: SizedBox(width: 20.w, height: 20.h, child: Image.asset(model.teamAvatar[2])),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
