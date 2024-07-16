import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

Widget userNameLoading() {
  return const Skeletonizer(
    effect: ShimmerEffect(),
    containersColor: Colors.black,
    child: Text(
      'Username',
      style: TextStyle(
        fontSize: 18,
      ),
    ),
  );
}
