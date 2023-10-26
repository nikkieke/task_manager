import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/app/utils/utils.dart';


class App extends StatefulHookConsumerWidget   {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    final appRouter = ref.watch(goRouterProvider);
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
         return MaterialApp.router(
           title: 'Flutter Demo',
           theme: AppTheme.dark,
           routerConfig: appRouter,
         );
    },
    );
  }
}
