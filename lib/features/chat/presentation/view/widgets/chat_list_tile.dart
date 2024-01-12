import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/app/app.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({required this.model,super.key});

  final Chat model;
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
          const Space(2),
          Container(
            width: 6.w,
            height: 6.h,
            decoration: ShapeDecoration(
              color: model.isOnline? Theme.of(context).primaryColor: Colors.transparent,
              shape: const OvalBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

class Chat{
  Chat({required this.title, required this.subTitle,
    required this.isOnline, required this.lastMessageTime, required this.avatar,});

  final String title;
  final String avatar;
  final String subTitle;
  final String lastMessageTime;
  bool isOnline;
}

final List<Chat> chats = [
  Chat(
      title: 'Olivia Anna',
      subTitle: 'Hi, please check the last task...',
      isOnline: true,
      lastMessageTime: '31 min',
      avatar: AppImage.avatar2,
  ),
  Chat(
    title: 'Emna',
    subTitle: 'Hi, please check the last task...',
    isOnline: true,
    lastMessageTime: '43 min',
    avatar: AppImage.avatar5,
  ),
  Chat(
    title: 'Robert Brown',
    subTitle: 'Hi, please check the last task...',
    isOnline: false,
    lastMessageTime: '6 Nov',
    avatar: AppImage.avatar4,
  ),
  Chat(
    title: 'James',
    subTitle: 'Hi, please check the last task...',
    isOnline: false,
    lastMessageTime: '8 Nov',
    avatar: AppImage.avatar1,
  ),
  Chat(
    title: 'Sophia',
    subTitle: 'Hi, please check the last task...',
    isOnline: false,
    lastMessageTime: '27 Dec',
    avatar: AppImage.avatar3,
  ),
];
