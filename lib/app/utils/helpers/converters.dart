import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter extends JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();
  @override
  DateTime fromJson(json) => json.toDate();

  @override
  Timestamp toJson(object) => Timestamp.fromDate(object);
}

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(json) => DateTime.parse(json);

  @override
  String toJson(object) => object.toIso8601String();
}

class TimeOfDayConverter implements JsonConverter<TimeOfDay, String> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(json) {
    final data = jsonDecode(json) as Map<String, dynamic>;
    return TimeOfDay(hour: data['hour'] as int, minute: data['minute'] as int);
  }

  @override
  String toJson(object) {
    final data = <String, dynamic>{
      'hour': object.hour,
      'minute': object.minute
    };
    return jsonEncode(data);
  }
}
