import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  late RiveAnimationController<dynamic> animationBtnController;

  @override
  void initState() {
    animationBtnController = OneShotAnimation(
      'Timeline 1',
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
        // Column(
        //   children: [
        //     Text('Manage your Tasks with Task Manager', style: Theme.of(context).textTheme.titleLarge,),
        //   ],
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: GestureDetector(
              onTap: (){
                animationBtnController.isActive = true;
              },
              child: SizedBox(
                width: 300,
                height: 58,
                child: RiveAnimation.asset(
                  'assets/images/button.riv',
                  controllers: [animationBtnController],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
