import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/features/features.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    required this.model,
    super.key,
  });
  final UserDetails model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      width: double.maxFinite,
      height: 54.h,
      decoration: const BoxDecoration(
        color: Color(0xff1b1b1b),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                model.leadingIcon,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.white54,
                  BlendMode.srcIn,
                ),
              ),
              Space(20.w),
              Text(model.title),
            ],
          ),
          SvgPicture.asset(
            model.trailingIcon,
            width: 20,
            colorFilter: const ColorFilter.mode(
              Colors.white54,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
