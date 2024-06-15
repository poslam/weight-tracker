// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterEntity {
  FilterStatus get name => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterEntityCopyWith<FilterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterEntityCopyWith<$Res> {
  factory $FilterEntityCopyWith(
          FilterEntity value, $Res Function(FilterEntity) then) =
      _$FilterEntityCopyWithImpl<$Res, FilterEntity>;
  @useResult
  $Res call({FilterStatus name, String categoryId});
}

/// @nodoc
class _$FilterEntityCopyWithImpl<$Res, $Val extends FilterEntity>
    implements $FilterEntityCopyWith<$Res> {
  _$FilterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? categoryId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as FilterStatus,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterEntityImplCopyWith<$Res>
    implements $FilterEntityCopyWith<$Res> {
  factory _$$FilterEntityImplCopyWith(
          _$FilterEntityImpl value, $Res Function(_$FilterEntityImpl) then) =
      __$$FilterEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FilterStatus name, String categoryId});
}

/// @nodoc
class __$$FilterEntityImplCopyWithImpl<$Res>
    extends _$FilterEntityCopyWithImpl<$Res, _$FilterEntityImpl>
    implements _$$FilterEntityImplCopyWith<$Res> {
  __$$FilterEntityImplCopyWithImpl(
      _$FilterEntityImpl _value, $Res Function(_$FilterEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? categoryId = null,
  }) {
    return _then(_$FilterEntityImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as FilterStatus,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilterEntityImpl implements _FilterEntity {
  const _$FilterEntityImpl({required this.name, required this.categoryId});

  @override
  final FilterStatus name;
  @override
  final String categoryId;

  @override
  String toString() {
    return 'FilterEntity(name: $name, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterEntityImplCopyWith<_$FilterEntityImpl> get copyWith =>
      __$$FilterEntityImplCopyWithImpl<_$FilterEntityImpl>(this, _$identity);
}

abstract class _FilterEntity implements FilterEntity {
  const factory _FilterEntity(
      {required final FilterStatus name,
      required final String categoryId}) = _$FilterEntityImpl;

  @override
  FilterStatus get name;
  @override
  String get categoryId;
  @override
  @JsonKey(ignore: true)
  _$$FilterEntityImplCopyWith<_$FilterEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
