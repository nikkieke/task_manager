import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/calendar/view/widgets/widgets.dart';


class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    IconButton(
                      onPressed: (){
                        context.pop();
                      },
                      icon: SvgPicture.asset(AppImage.arrowLeft, width: 20.w,),

                    ),
                    Align(
                      child: Text('Schedule',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: (){

                        },
                        icon: SvgPicture.asset(AppImage.addSquare, width: 20.w,
                          colorFilter: const ColorFilter.mode(
                            Colors.white70,
                            BlendMode.srcIn,
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
                Space(42.h),
                const HorizontalCalendar(),
                Space(32.h),
                Text('Today’s Tasks', style: Theme.of(context).textTheme.titleLarge?.
                copyWith(fontSize: 20.sp,),
                ),
                Space(26.h),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),),
                      itemCount: todayTasks.length,
                      itemBuilder: (context, index){
                        final task = todayTasks[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: TaskCard(model: task),
                        );
                      },
                  ),
                ),

              ],
            ),
          ),
      ),
    );
  }
}
