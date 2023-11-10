import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CircleIndicator extends StatelessWidget {
  const CircleIndicator({
    required this.percent,
    super.key,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    final number = percent * 100;
    final percentage = getNumberBeforeDecimal(number);

    return CircularPercentIndicator(
      radius: 29.5,
      lineWidth: 2,
      progressColor: Theme.of(context).primaryColor,
      percent: percent,
      center: Text(
        '$percentage%',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 13.sp,),
      ),
    );
  }
}

class LineIndicator extends StatelessWidget {
  const LineIndicator({
    required this.percent,
    super.key,
  });

  final double percent;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      padding: EdgeInsets.zero,
      percent: percent,
      progressColor: Colors.white,
      barRadius: const Radius.circular(2),
    );
  }
}

int getNumberBeforeDecimal(double number) {
  final numberToString = number.toString();

  final decimalIndex = numberToString.indexOf('.');

  final numbersBeforeDecimal = numberToString.substring(0, decimalIndex);

  final result = int.parse(numbersBeforeDecimal);

  return result;
}
