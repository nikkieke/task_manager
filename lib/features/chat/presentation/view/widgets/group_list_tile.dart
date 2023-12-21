import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/app/app.dart';

class GroupListTile extends StatelessWidget {
  const GroupListTile({required this.model,super.key});

  final GroupChat model;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
      SizedBox(width: 47.w, height: 47.h, child: Image.asset(model.avatar)),
      title: Text(model.title,
        style: Theme.of(context).textTheme.bodyMedium?.
        copyWith(fontWeight: FontWeight.w600),),
      subtitle: Text(model.subTitle,
        style: Theme.of(context).textTheme.bodyMedium?.
        copyWith(fontSize: 14.sp),),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(model.lastMessageTime,
            style: Theme.of(context).textTheme.bodyMedium?.
            copyWith(fontSize: 10.sp),),
        ],
      ),
    );
  }
}

class GroupChat{
  GroupChat({required this.title, required this.subTitle,
     required this.lastMessageTime, required this.avatar,});

  final String title;
  final String avatar;
  final String subTitle;
  final String lastMessageTime;
}

final List<GroupChat> groupChats = [
  GroupChat(
    title: 'Back-End Team',
    subTitle: 'Robert: Did you check the last task?',
    lastMessageTime: '31 min',
    avatar: AppImage.avatar10,
  ),
  GroupChat(
    title: 'Front-End Team',
    subTitle: 'Robert: Did you check the last task?',
    lastMessageTime: '43 min',
    avatar: AppImage.avatar14,
  ),
  GroupChat(
    title: 'Android Developers',
    subTitle: 'Robert: Did you check the last task?',
    lastMessageTime: '6 Nov',
    avatar: AppImage.avatar10,
  ),
  GroupChat(
    title: 'IOS Developers',
    subTitle: 'Robert: Did you check the last task?',
    lastMessageTime: '8 Nov',
    avatar: AppImage.avatar13,
  ),
  GroupChat(
    title: 'School System Project',
    subTitle: 'Robert: Did you check the last task?',
    lastMessageTime: '27 Dec',
    avatar: AppImage.avatar3,
  ),
];
