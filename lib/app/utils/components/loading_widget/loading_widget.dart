import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

//Todo fix loading widget
Widget userNameLoading() {
  return Skeletonizer(
    effect: ShimmerEffect(),
    child: Container(
      height: 20,
      width: 100,
      child: const Text(
        'Username',
        style: TextStyle(
          fontSize: 18,
          color: Color(0xFFa6a6a7),
        ),
      ),
    ),
  );
}
