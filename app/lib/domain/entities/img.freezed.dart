// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'img.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImgEntity {
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get taskId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImgEntityCopyWith<ImgEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImgEntityCopyWith<$Res> {
  factory $ImgEntityCopyWith(ImgEntity value, $Res Function(ImgEntity) then) =
      _$ImgEntityCopyWithImpl<$Res, ImgEntity>;
  @useResult
  $Res call({String id, String url, String taskId});
}

/// @nodoc
class _$ImgEntityCopyWithImpl<$Res, $Val extends ImgEntity>
    implements $ImgEntityCopyWith<$Res> {
  _$ImgEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? taskId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImgEntityImplCopyWith<$Res>
    implements $ImgEntityCopyWith<$Res> {
  factory _$$ImgEntityImplCopyWith(
          _$ImgEntityImpl value, $Res Function(_$ImgEntityImpl) then) =
      __$$ImgEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String url, String taskId});
}

/// @nodoc
class __$$ImgEntityImplCopyWithImpl<$Res>
    extends _$ImgEntityCopyWithImpl<$Res, _$ImgEntityImpl>
    implements _$$ImgEntityImplCopyWith<$Res> {
  __$$ImgEntityImplCopyWithImpl(
      _$ImgEntityImpl _value, $Res Function(_$ImgEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
    Object? taskId = null,
  }) {
    return _then(_$ImgEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImgEntityImpl implements _ImgEntity {
  const _$ImgEntityImpl(
      {required this.id, required this.url, required this.taskId});

  @override
  final String id;
  @override
  final String url;
  @override
  final String taskId;

  @override
  String toString() {
    return 'ImgEntity(id: $id, url: $url, taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImgEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, url, taskId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImgEntityImplCopyWith<_$ImgEntityImpl> get copyWith =>
      __$$ImgEntityImplCopyWithImpl<_$ImgEntityImpl>(this, _$identity);
}

abstract class _ImgEntity implements ImgEntity {
  const factory _ImgEntity(
      {required final String id,
      required final String url,
      required final String taskId}) = _$ImgEntityImpl;

  @override
  String get id;
  @override
  String get url;
  @override
  String get taskId;
  @override
  @JsonKey(ignore: true)
  _$$ImgEntityImplCopyWith<_$ImgEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
