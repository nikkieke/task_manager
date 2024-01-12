import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/features/chat/presentation/view/widgets/widgets.dart';


class ContactListTile extends StatelessWidget {
  const ContactListTile({required this.model, super.key});

  final AZItem model;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
      SizedBox(width: 47.w, height: 47.h, child: Image.asset(model.avatar)),
      title: Text(model.name,
        style: Theme.of(context).textTheme.bodyMedium?.
        copyWith(fontWeight: FontWeight.w600),),
    );
  }
}
