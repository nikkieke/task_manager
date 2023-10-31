import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/chat/view/widgets/widgets.dart';


class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> with TickerProviderStateMixin{
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  late TabController _tabController;

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
                    child: Text('Messages',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: (){

                      },
                      icon: SvgPicture.asset(AppImage.edit, width: 20.w,),

                    ),
                  ),
                ],
              ),
              Space(36.h),
              SizedBox(
                height: 47.h,
                width: double.maxFinite,
                child: TabBar(
                  controller: _tabController,
                  splashBorderRadius: BorderRadius.circular(3),
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  dividerColor: Colors.transparent,
                  labelColor: Colors.black,
                  labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                  unselectedLabelColor: const Color(0xFFa6a6a7),
                  unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
                  labelPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 0,
                  indicatorPadding: const EdgeInsets.only(left: 5, right: 5),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Chat',
                    ),
                    Tab(
                      text: 'Groups',
                    ),
                  ],
                ),
              ),
              Space(32.h),
              SizedBox(
                width: double.maxFinite,
                height: 400.h,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const ChatTab(),

                    Container(),
                  ],
                ),
              ),
              Space(52.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 175.w,
                    height: 57.h,
                    decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),),
                    child: Text('Start Chat',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),),
                  ),
                  Space(29.w),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
