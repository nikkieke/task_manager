// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      projectOwnerId: json['projectOwnerId'] as String? ?? '',
      teamMembers: (json['teamMembers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isDone: json['isDone'] as bool? ?? false,
      projectCompletion: (json['projectCompletion'] as num?)?.toDouble() ?? 0.0,
      status: $enumDecodeNullable(_$ProjectStatusEnumMap, json['status']) ??
          ProjectStatus.upcoming,
      dueDate: const DateTimeConverter().fromJson(json['dueDate'] as String),
      dueTime: const TimeOfDayConverter().fromJson(json['dueTime'] as String),
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'projectOwnerId': instance.projectOwnerId,
      'teamMembers': instance.teamMembers,
      'isDone': instance.isDone,
      'projectCompletion': instance.projectCompletion,
      'status': _$ProjectStatusEnumMap[instance.status]!,
      'dueDate': const DateTimeConverter().toJson(instance.dueDate),
      'dueTime': const TimeOfDayConverter().toJson(instance.dueTime),
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };

const _$ProjectStatusEnumMap = {
  ProjectStatus.upcoming: 'upcoming',
  ProjectStatus.ongoing: 'ongoing',
  ProjectStatus.completed: 'completed',
};
