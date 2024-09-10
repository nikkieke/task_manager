// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) {
  return _ProjectModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get projectOwnerId => throw _privateConstructorUsedError;
  List<String> get teamMembers => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  double get projectCompletion => throw _privateConstructorUsedError;
  ProjectStatus get status => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get dueDate => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay get dueTime => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectModelCopyWith<ProjectModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectModelCopyWith<$Res> {
  factory $ProjectModelCopyWith(
          ProjectModel value, $Res Function(ProjectModel) then) =
      _$ProjectModelCopyWithImpl<$Res, ProjectModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String projectOwnerId,
      List<String> teamMembers,
      bool isDone,
      double projectCompletion,
      ProjectStatus status,
      @DateTimeConverter() DateTime dueDate,
      @TimeOfDayConverter() TimeOfDay dueTime,
      @DateTimeConverter() DateTime createdAt});
}

/// @nodoc
class _$ProjectModelCopyWithImpl<$Res, $Val extends ProjectModel>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? projectOwnerId = null,
    Object? teamMembers = null,
    Object? isDone = null,
    Object? projectCompletion = null,
    Object? status = null,
    Object? dueDate = null,
    Object? dueTime = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      projectOwnerId: null == projectOwnerId
          ? _value.projectOwnerId
          : projectOwnerId // ignore: cast_nullable_to_non_nullable
              as String,
      teamMembers: null == teamMembers
          ? _value.teamMembers
          : teamMembers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      projectCompletion: null == projectCompletion
          ? _value.projectCompletion
          : projectCompletion // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectStatus,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueTime: null == dueTime
          ? _value.dueTime
          : dueTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectModelImplCopyWith<$Res>
    implements $ProjectModelCopyWith<$Res> {
  factory _$$ProjectModelImplCopyWith(
          _$ProjectModelImpl value, $Res Function(_$ProjectModelImpl) then) =
      __$$ProjectModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String projectOwnerId,
      List<String> teamMembers,
      bool isDone,
      double projectCompletion,
      ProjectStatus status,
      @DateTimeConverter() DateTime dueDate,
      @TimeOfDayConverter() TimeOfDay dueTime,
      @DateTimeConverter() DateTime createdAt});
}

/// @nodoc
class __$$ProjectModelImplCopyWithImpl<$Res>
    extends _$ProjectModelCopyWithImpl<$Res, _$ProjectModelImpl>
    implements _$$ProjectModelImplCopyWith<$Res> {
  __$$ProjectModelImplCopyWithImpl(
      _$ProjectModelImpl _value, $Res Function(_$ProjectModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? projectOwnerId = null,
    Object? teamMembers = null,
    Object? isDone = null,
    Object? projectCompletion = null,
    Object? status = null,
    Object? dueDate = null,
    Object? dueTime = null,
    Object? createdAt = null,
  }) {
    return _then(_$ProjectModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      projectOwnerId: null == projectOwnerId
          ? _value.projectOwnerId
          : projectOwnerId // ignore: cast_nullable_to_non_nullable
              as String,
      teamMembers: null == teamMembers
          ? _value._teamMembers
          : teamMembers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      projectCompletion: null == projectCompletion
          ? _value.projectCompletion
          : projectCompletion // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProjectStatus,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueTime: null == dueTime
          ? _value.dueTime
          : dueTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectModelImpl extends _ProjectModel {
  const _$ProjectModelImpl(
      {this.id = '',
      this.title = '',
      this.projectOwnerId = '',
      final List<String> teamMembers = const [],
      this.isDone = false,
      this.projectCompletion = 0.0,
      this.status = ProjectStatus.upcoming,
      @DateTimeConverter() required this.dueDate,
      @TimeOfDayConverter() required this.dueTime,
      @DateTimeConverter() required this.createdAt})
      : _teamMembers = teamMembers,
        super._();

  factory _$ProjectModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String projectOwnerId;
  final List<String> _teamMembers;
  @override
  @JsonKey()
  List<String> get teamMembers {
    if (_teamMembers is EqualUnmodifiableListView) return _teamMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teamMembers);
  }

  @override
  @JsonKey()
  final bool isDone;
  @override
  @JsonKey()
  final double projectCompletion;
  @override
  @JsonKey()
  final ProjectStatus status;
  @override
  @DateTimeConverter()
  final DateTime dueDate;
  @override
  @TimeOfDayConverter()
  final TimeOfDay dueTime;
  @override
  @DateTimeConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'ProjectModel(id: $id, title: $title, projectOwnerId: $projectOwnerId, teamMembers: $teamMembers, isDone: $isDone, projectCompletion: $projectCompletion, status: $status, dueDate: $dueDate, dueTime: $dueTime, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.projectOwnerId, projectOwnerId) ||
                other.projectOwnerId == projectOwnerId) &&
            const DeepCollectionEquality()
                .equals(other._teamMembers, _teamMembers) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.projectCompletion, projectCompletion) ||
                other.projectCompletion == projectCompletion) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.dueTime, dueTime) || other.dueTime == dueTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      projectOwnerId,
      const DeepCollectionEquality().hash(_teamMembers),
      isDone,
      projectCompletion,
      status,
      dueDate,
      dueTime,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      __$$ProjectModelImplCopyWithImpl<_$ProjectModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectModel extends ProjectModel {
  const factory _ProjectModel(
          {final String id,
          final String title,
          final String projectOwnerId,
          final List<String> teamMembers,
          final bool isDone,
          final double projectCompletion,
          final ProjectStatus status,
          @DateTimeConverter() required final DateTime dueDate,
          @TimeOfDayConverter() required final TimeOfDay dueTime,
          @DateTimeConverter() required final DateTime createdAt}) =
      _$ProjectModelImpl;
  const _ProjectModel._() : super._();

  factory _ProjectModel.fromJson(Map<String, dynamic> json) =
      _$ProjectModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get projectOwnerId;
  @override
  List<String> get teamMembers;
  @override
  bool get isDone;
  @override
  double get projectCompletion;
  @override
  ProjectStatus get status;
  @override
  @DateTimeConverter()
  DateTime get dueDate;
  @override
  @TimeOfDayConverter()
  TimeOfDay get dueTime;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ProjectModelImplCopyWith<_$ProjectModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
