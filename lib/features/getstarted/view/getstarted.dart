import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'package:task_manager/app/app.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {

  /// rive controller and input values
  StateMachineController? controller;

  SMIInput<bool>? takeBreak;

  final String currentActivity = 'Take a break';

  bool breakOn = false;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 400.h,
              child: RiveAnimation.asset(
                AppImage.pomodoro,
                stateMachines: const ['State Machine 1'],
                onInit: (artboard) {
                  controller = StateMachineController.fromArtboard(
                    artboard,
                    'State Machine 1',
                  );
                  if (controller == null) return;
                  artboard.addController(controller!);
                  takeBreak = controller?.findInput('break');
                },
              ),
            ),
            Space(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(breakOn? 'Get back to Work': 'Take a break',
                  style: Theme.of(context).textTheme.titleLarge,),
                const Space(10),
                Switch(
                  value: breakOn,
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0xffb42c3a),
                  onChanged: (bool value) {
                    setState(() {
                      breakOn = value;
                      takeBreak?.change(breakOn);
                    });
                  },),
              ],
            ),
            Space(20.h),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Manage Your Everyday Tasks!',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                ),),
            ),
            Space(25.h),
            ElevatedButton(
                onPressed: (){
                  context.pushNamed(AppRoute.login.name);
                },
                child: Text('Get Started', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}
