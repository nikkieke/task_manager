import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/notifications/view/widget/widget.dart';


class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
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
                    child: Text('Notifications',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
                    ),
                  ),
                ],
              ),
              Space(40.h),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),),
                    itemCount: notifications.length,
                    itemBuilder: (context, index){
                      final notification = notifications[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: NotificationListTile(model: notification,),
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
