import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/chat/view/widgets/widgets.dart';

class NewChatView extends StatelessWidget {
  const NewChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
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
                    child: Text('New Message',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: (){

                      },
                      icon: SvgPicture.asset(AppImage.search, width: 20.w,),

                    ),
                  ),
                ],
              ),
              Space(42.h),
              TextButton(
                onPressed: () {  },
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(10),
                      width: 47,
                      height: 47,
                      decoration: ShapeDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: const OvalBorder(),
                      ),
                      child: SvgPicture.asset(AppImage.users),
                    ),
                    Space(16.w),
                    Text('Create a group',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Space(19.h),
              const ContactListView(),
            ],
          ),
        ),
      ),
    );
  }
}
