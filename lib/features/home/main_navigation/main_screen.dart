import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/features/features.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_manager/features/notifications/notifications.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {

  int pageIndex = 0;

  List<Widget>pageList = [
    const HomeView(),
    const ChatView(),
    const NewProjectView(),
    const CalendarView(),
    const NotificationsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: widget.child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color:  Color(0xff1b1b1b),
        ),
        child: BottomNavigationBar(
          items: [],

        ),
      ),
    );
  }
}

class PersistentTabController extends ChangeNotifier{
  PersistentTabController({int initialIndex = 0}): _index = initialIndex,
  assert(initialIndex >= 0, 'check that initialIndex is not less than zero');

  bool _isDisposed = false;
  int get index => _index;
  int _index;

  set index(int value){
    assert(value >= 0, 'check that value is not less than zero');
    if(_index == value){
      return;
    }
    _index = value;
    notifyListeners();
  }

  @mustCallSuper
  @override
  void dispose(){
    _isDisposed = true;
    super.dispose();
  }
}
