import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/app/app.dart';


class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({super.key});

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  ///To track date
  DateTime selectedDate = DateTime.now();
  ///Index tracker
  int currentDateSelectedIndex = 0;
  ///ScrollController for ListView
  ScrollController scrollController = ScrollController();
  ///List of months
  List<String> listOfMonths = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  ///List of days
  List<String> listOfDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(listOfMonths[selectedDate.month - 1],
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20.sp,
            ),),
        ),
        Space(26.h),
        SizedBox(
          height: 80.h,
          width: double.maxFinite,
          child: ListView.separated(
            controller: scrollController,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),),
            scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 10,);
              },
            itemCount: 365,
            itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    setState(() {
                      currentDateSelectedIndex = index;
                      selectedDate =
                          DateTime.now().add(Duration(days: index));
                    });
                  },
                  child: Container(
                    height: 69.h,
                    width: 45.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                        color: currentDateSelectedIndex == index
                            ? Theme.of(context).primaryColor:
                            const Color(0xff1b1b1b),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(DateTime.now()
                            .add(Duration(days: index))
                            .day
                            .toString(),
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                              color: currentDateSelectedIndex == index?
                                  Colors.black: Colors.white54,
                          ),
                        ),
                        Space(5.h),
                        Text(listOfDays[DateTime.now()
                            .add(Duration(days: index))
                            .weekday -
                            1],
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                            color: currentDateSelectedIndex == index?
                            Colors.black: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
            },
          ),
        ),
      ],
    );
  }
}
