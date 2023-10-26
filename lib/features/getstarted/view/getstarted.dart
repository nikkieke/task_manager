import 'package:flutter/material.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Manage your Tasks with Task Manager', style: Theme.of(context).textTheme.titleLarge,),
          ],
        ),
      ),
    );
  }
}
