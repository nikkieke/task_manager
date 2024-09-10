import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/app/utils/helpers/converters.dart';

part 'generated/project_model.freezed.dart';
part 'generated/project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  const ProjectModel._();

  const factory ProjectModel({
    @Default('') String id,
    @Default('') String title,
    @Default('') String projectOwnerId,
    @Default([]) List<String> teamMembers,
    @Default(false) bool isDone,
    @Default(0.0) double projectCompletion,
    @Default(ProjectStatus.upcoming) ProjectStatus status,
    @DateTimeConverter() required DateTime dueDate,
    @TimeOfDayConverter() required TimeOfDay dueTime,
    @DateTimeConverter() required DateTime createdAt,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}

enum ProjectStatus { upcoming, ongoing, completed }
