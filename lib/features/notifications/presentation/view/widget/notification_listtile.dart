import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/app/app.dart';

class Notification{
  Notification({required this.avatar, required this.timeReceived});

  final String avatar;
  final String timeReceived;

}

final List<Notification>notifications =[
  Notification(avatar: AppImage.avatar2, timeReceived: '31 min'),
  Notification(avatar: AppImage.avatar5, timeReceived: '31 min'),
  Notification(avatar: AppImage.avatar12, timeReceived: '31 min'),
  Notification(avatar: AppImage.avatar15, timeReceived: '4 hours'),
  Notification(avatar: AppImage.avatar11, timeReceived: '4 hours'),
  Notification(avatar: AppImage.avatar3, timeReceived: '4 hours'),

];
class NotificationListTile extends StatelessWidget {
  const NotificationListTile({
    required this.model,
    super.key,
  });

  final Notification model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
      SizedBox(width: 47.w, height: 47.h, child: Image.asset(model.avatar)),
      subtitle: RichText(
        text: TextSpan(
          text: 'Olivia Anna ',
          style: Theme.of(context).textTheme.bodyMedium?.
          copyWith(fontSize: 14.sp, fontWeight: FontWeight.w600),
          children: <TextSpan>[
            TextSpan(
              text: 'left a comment in task',
              style: Theme.of(context).textTheme.bodyMedium?.
              copyWith(fontSize: 14.sp,),),
            TextSpan(
              text: '  Mobile App Design Project',
              style: Theme.of(context).textTheme.bodyMedium?.
              copyWith(fontSize: 14.sp,color: Theme.of(context).primaryColor),),
          ],
        ),
      ),
      trailing: Text(model.timeReceived,
        style: Theme.of(context).textTheme.bodyMedium?.
        copyWith(fontSize: 10.sp),),
    );
  }
}
