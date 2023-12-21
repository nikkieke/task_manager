import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/features/home/presentation/widgets/widgets.dart';


class AllTasksCard extends StatefulWidget {
  const AllTasksCard({
    required this.model,
     super.key,
  });

  final AllTasks model;

  @override
  State<AllTasksCard> createState() => _AllTasksCardState();
}

class _AllTasksCardState extends State<AllTasksCard> {
    bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 19),
      width: 370.w,
      height: 58.h,
      decoration: const BoxDecoration(
        color: Color(0xff1b1b1b),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.model.title, style: Theme.of(context).textTheme.bodyMedium,),
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
              value: widget.model.checked,
              onChanged: (value){
                setState(() {
                  widget.model.checked = !widget.model.checked;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
