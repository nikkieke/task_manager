import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:task_manager/app/app.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133.h,
      child: Stack(
        children: [
          Container(
            height: 133.h,
            width: 133.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 3.w,
              ),
            ),
            child: Image.asset(
              AppImage.avatar1,
              scale: 0.6,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: FloatingActionButton.small(
              heroTag: null,
              onPressed: () {},
              backgroundColor: const Color(0xff1b1b1b),
              shape: const CircleBorder(),
              child: SvgPicture.asset(
                AppImage.addSquare,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.white54,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
