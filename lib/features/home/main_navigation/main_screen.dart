import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/app/app.dart';
import 'package:task_manager/features/features.dart';
import 'package:task_manager/features/notifications/notifications.dart';

final routeStateProvider = ChangeNotifierProvider((ref) {
  return PersistentTabController();
});

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(routeStateProvider);
  }

  int pageIndex = 0;

  List<Widget> pageList = [
    const HomeView(),
    const ChatView(),
    const NewProjectView(),
    const CalendarView(),
    const NotificationsView(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(routeStateProvider);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xff1b1b1b),
        ),
        child: BottomNavigationBar(
          currentIndex: controller.index,
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff1b1b1b),
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white54,
          unselectedLabelStyle:
              Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 10.sp),
          selectedLabelStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Theme.of(context).primaryColor, fontSize: 10.sp),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 20,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImage.home,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.white54,
                  BlendMode.srcIn,
                ),
              ),
              activeIcon: SvgPicture.asset(
                AppImage.home,
                width: 20,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).primaryColor, BlendMode.srcIn,),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImage.messages,
                width: 20,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              icon: SvgPicture.asset(
                AppImage.messages,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.white54,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(6),
                height: 34.h,
                width: 34.w,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  color: Theme.of(context).primaryColor,
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
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImage.calendar,
                width: 20,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              icon: SvgPicture.asset(
                AppImage.calendar,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.white54,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                AppImage.notification,
                width: 20,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              icon: SvgPicture.asset(
                AppImage.notification,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.white54,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Notifications',
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int value) {
    ref.read(routeStateProvider).index = value;
    switch (value) {
      case 0:
        context.goNamed(AppRoute.home.name);
      case 1:
        context.goNamed(AppRoute.chat.name);
      case 2:
        context.goNamed(AppRoute.newProject.name);
      case 3:
        context.goNamed(AppRoute.calendar.name);
      case 4:
        context.goNamed(AppRoute.notifications.name);
    }
  }
}

class PersistentTabController extends ChangeNotifier {
  PersistentTabController({int initialIndex = 0})
      : _index = initialIndex,
        assert(
          initialIndex >= 0,
          'check that initialIndex is not less than zero',
        );

  bool _isDisposed = false;
  int get index => _index;
  int _index;

  set index(int value) {
    assert(value >= 0, 'check that value is not less than zero');
    if (_index == value) {
      return;
    }
    _index = value;
    notifyListeners();
  }

  @mustCallSuper
  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
