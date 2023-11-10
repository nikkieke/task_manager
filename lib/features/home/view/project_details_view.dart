import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/home/widgets/widgets.dart';



class ProjectDetailsView extends StatefulWidget {
  const ProjectDetailsView({super.key});

  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 30, 22, 0),
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
                      child: Text('Project Details',
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
                Space(50.h),
                Text(
                  'Real Estate App Design',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Space(27.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          height: 47.h,
                          width: 47.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: SvgPicture.asset(AppImage.calendarRemove,),
                        ),
                        Space(5.w),
                        Column(
                          children: [
                            Text('Due Date', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 12.sp,
                            ),),
                            Text('20 June', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          height: 47.h,
                          width: 47.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: SvgPicture.asset(AppImage.users,),
                        ),
                        Space(5.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Project Team', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 12.sp,
                            ),),
                            SizedBox(
                              width: 60.w,
                              child: Stack(
                                children: [
                                  SizedBox(width: 20.w, height: 20.h, child: Image.asset(AppImage.avatar1)),
                                  Positioned(
                                    left: 10.w,
                                    top: 0,
                                    bottom: 0,
                                    child: SizedBox(width: 20.w, height: 20.h, child: Image.asset(AppImage.avatar2)),),
                                  Positioned(
                                    left: 20.w,
                                    top: 0,
                                    bottom: 0,
                                    child: SizedBox(width: 20.w, height: 20.h, child: Image.asset(AppImage.avatar4)),),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
                Space(30.h),
                Text('Project Details', style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 18.sp,
                ),),
                Space(10.h),
                Text('Lorem Ipsum is simply dummy text of the printing '
                    "and typesetting industry. Lorem Ipsum has been the industry's "
                    'standard dummy text ever since the 1500s, when an unknown printer '
                    'took a galley of type and scrambled.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Space(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Project Progress', style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 18.sp,
                    ),),
                    const CircleIndicator(percent: 0.60,),
                  ],
                ),
                Space(10.h),
                Text('All Tasks', style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 18.sp,
                ),),
                Space(22.h),
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),),
                      itemCount: aT.length,
                      itemBuilder: (context, index){
                        final allTasks = aT[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: AllTasksCard(model: allTasks,),
                        );
                      },
                  ),
                ),
              ],
            ),
          ),
        ),
      bottomNavigationBar: 
      Container(
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
        height: 114.h,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(AppRoute.addTask.name);
          },
          child: Text('Add Task', style: Theme.of(context).textTheme.bodyMedium,),
        ),
      ),
    );
  }
}
