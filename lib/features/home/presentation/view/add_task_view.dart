import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/app/app.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final TextEditingController details = TextEditingController();
  bool checked = false;

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
                    child: Text('Create New Task',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
                    ),
                  ),
                ],
              ),
              Space(39.h),
              Text('Task',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
              ),
              Space(20.h),
              Container(
                alignment: Alignment.center,
                height: 82.h,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff1f1f1f),
                ),
                child: TextFormInput(
                  keyboardType:TextInputType.name,
                  controller: details,
                  labelText: 'Input your task..',
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[ ]')),
                  ],
                ),
              ),
              Space(23.h),
              Text('Add team members',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
              ),
              Space(21.h),
              Row(
                children: [
                  SizedBox(
                    width: 300.w,
                    height: 41.h,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),),
                      scrollDirection: Axis.horizontal,
                      children: const [
                        AddMember(name: 'Robert', avatar: AppImage.avatar2,),
                        SizedBox(width: 10,),
                        AddMember(name: 'Sophia', avatar: AppImage.avatar7,),
                      ],
                    ),
                  ),
                  Space(10.w),
                  TextButton(
                    onPressed: () {  },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 41.h,
                      width: 41.w,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: SvgPicture.asset(
                        AppImage.addSquare,
                        width: 20,
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Space(21.h),
              Text('Time & Date',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
              ),
              Space(21.h),
              const Row(
                children: [
                  AddTaskTimeDate(text: '10:30 AM', icon: AppImage.clock,),
                  Space(20),
                  AddTaskTimeDate(text: '15/11/2022', icon: AppImage.calendarLinear,),
                ],
              ),
              Space(21.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 19),
                    width: 150.w,
                    height: 48.h,
                    decoration: const BoxDecoration(
                      color: Color(0xff1b1b1b),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Remind me', style: Theme.of(context).textTheme.bodyMedium,),
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Checkbox(
                            side: const BorderSide(
                              width: 1.5,
                            ),
                            value: checked,
                            onChanged: (value){
                              setState(() {
                                checked = !checked;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Space(115.h),
              ElevatedButton(
                onPressed: (){},
                child: Text(
                  'Create',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddTaskTimeDate extends StatelessWidget {
  const AddTaskTimeDate({
    required this.text,
    required this.icon,
    super.key,
  });

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          height: 41.h,
          width: 41.w,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          child: SvgPicture.asset(
            icon,
            width: 20,
            colorFilter: const ColorFilter.mode(
              Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 41.h,
          width: 135.w,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Color(0xff1f1f1f),
          ),
          child:  Text(text),
        ),
      ],
    );
  }
}

class AddMember extends StatelessWidget {
  const AddMember({
    required this.name,
    required this.avatar,
    super.key,
  });

  final String name;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: 150.w,
      height: 41.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xff1f1f1f),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width:20.w, height: 20.w, child: Image.asset(avatar)),
              const Space(5),
              Text(name, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14.sp)),
            ],
          ),
          SvgPicture.asset(
            AppImage.closeSquare,
            width: 20,
            colorFilter: const ColorFilter.mode(
              Colors.white54,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
