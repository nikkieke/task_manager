import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager/app/app.dart';


class NewProjectView extends StatefulWidget {
  const NewProjectView({super.key});

  @override
  State<NewProjectView> createState() => _NewProjectViewState();
}

class _NewProjectViewState extends State<NewProjectView> {
  final TextEditingController title = TextEditingController();
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
                    child: Text('Create New Project',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
                    ),
                  ),
                ],
              ),
              Space(39.h),
              Text('Project Title',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
              ),
              Space(10.h),
              Container(
                alignment: Alignment.center,
                height: 58,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff1f1f1f),
                ),
                child: TextFormInput(
                  keyboardType:TextInputType.name,
                  controller: title,
                  labelText: 'Input your project title..',
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[ ]')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
