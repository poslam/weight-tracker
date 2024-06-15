// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isFavourite => throw _privateConstructorUsedError;
  List<ImgEntity> get imgUrls => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskEntityCopyWith<TaskEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEntityCopyWith<$Res> {
  factory $TaskEntityCopyWith(
          TaskEntity value, $Res Function(TaskEntity) then) =
      _$TaskEntityCopyWithImpl<$Res, TaskEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime createdAt,
      String description,
      bool isCompleted,
      bool isFavourite,
      List<ImgEntity> imgUrls,
      String categoryId});
}

/// @nodoc
class _$TaskEntityCopyWithImpl<$Res, $Val extends TaskEntity>
    implements $TaskEntityCopyWith<$Res> {
  _$TaskEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? description = null,
    Object? isCompleted = null,
    Object? isFavourite = null,
    Object? imgUrls = null,
    Object? categoryId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      imgUrls: null == imgUrls
          ? _value.imgUrls
          : imgUrls // ignore: cast_nullable_to_non_nullable
              as List<ImgEntity>,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskEntityImplCopyWith<$Res>
    implements $TaskEntityCopyWith<$Res> {
  factory _$$TaskEntityImplCopyWith(
          _$TaskEntityImpl value, $Res Function(_$TaskEntityImpl) then) =
      __$$TaskEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime createdAt,
      String description,
      bool isCompleted,
      bool isFavourite,
      List<ImgEntity> imgUrls,
      String categoryId});
}

/// @nodoc
class __$$TaskEntityImplCopyWithImpl<$Res>
    extends _$TaskEntityCopyWithImpl<$Res, _$TaskEntityImpl>
    implements _$$TaskEntityImplCopyWith<$Res> {
  __$$TaskEntityImplCopyWithImpl(
      _$TaskEntityImpl _value, $Res Function(_$TaskEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? description = null,
    Object? isCompleted = null,
    Object? isFavourite = null,
    Object? imgUrls = null,
    Object? categoryId = null,
  }) {
    return _then(_$TaskEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      imgUrls: null == imgUrls
          ? _value._imgUrls
          : imgUrls // ignore: cast_nullable_to_non_nullable
              as List<ImgEntity>,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TaskEntityImpl implements _TaskEntity {
  const _$TaskEntityImpl(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.description,
      this.isCompleted = false,
      this.isFavourite = false,
      final List<ImgEntity> imgUrls = const [],
      required this.categoryId})
      : _imgUrls = imgUrls;

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime createdAt;
  @override
  final String description;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final bool isFavourite;
  final List<ImgEntity> _imgUrls;
  @override
  @JsonKey()
  List<ImgEntity> get imgUrls {
    if (_imgUrls is EqualUnmodifiableListView) return _imgUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imgUrls);
  }

  @override
  final String categoryId;

  @override
  String toString() {
    return 'TaskEntity(id: $id, name: $name, createdAt: $createdAt, description: $description, isCompleted: $isCompleted, isFavourite: $isFavourite, imgUrls: $imgUrls, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            const DeepCollectionEquality().equals(other._imgUrls, _imgUrls) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      createdAt,
      description,
      isCompleted,
      isFavourite,
      const DeepCollectionEquality().hash(_imgUrls),
      categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskEntityImplCopyWith<_$TaskEntityImpl> get copyWith =>
      __$$TaskEntityImplCopyWithImpl<_$TaskEntityImpl>(this, _$identity);
}

abstract class _TaskEntity implements TaskEntity {
  const factory _TaskEntity(
      {required final String id,
      required final String name,
      required final DateTime createdAt,
      required final String description,
      final bool isCompleted,
      final bool isFavourite,
      final List<ImgEntity> imgUrls,
      required final String categoryId}) = _$TaskEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get createdAt;
  @override
  String get description;
  @override
  bool get isCompleted;
  @override
  bool get isFavourite;
  @override
  List<ImgEntity> get imgUrls;
  @override
  String get categoryId;
  @override
  @JsonKey(ignore: true)
  _$$TaskEntityImplCopyWith<_$TaskEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
