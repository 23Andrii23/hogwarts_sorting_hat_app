// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wand.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WandModel _$WandModelFromJson(Map<String, dynamic> json) {
  return _WandModel.fromJson(json);
}

/// @nodoc
mixin _$WandModel {
  String? get wood => throw _privateConstructorUsedError;
  String? get core => throw _privateConstructorUsedError;
  double? get length => throw _privateConstructorUsedError;

  /// Serializes this WandModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WandModelCopyWith<WandModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WandModelCopyWith<$Res> {
  factory $WandModelCopyWith(WandModel value, $Res Function(WandModel) then) =
      _$WandModelCopyWithImpl<$Res, WandModel>;
  @useResult
  $Res call({String? wood, String? core, double? length});
}

/// @nodoc
class _$WandModelCopyWithImpl<$Res, $Val extends WandModel>
    implements $WandModelCopyWith<$Res> {
  _$WandModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wood = freezed,
    Object? core = freezed,
    Object? length = freezed,
  }) {
    return _then(_value.copyWith(
      wood: freezed == wood
          ? _value.wood
          : wood // ignore: cast_nullable_to_non_nullable
              as String?,
      core: freezed == core
          ? _value.core
          : core // ignore: cast_nullable_to_non_nullable
              as String?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WandModelImplCopyWith<$Res>
    implements $WandModelCopyWith<$Res> {
  factory _$$WandModelImplCopyWith(
          _$WandModelImpl value, $Res Function(_$WandModelImpl) then) =
      __$$WandModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? wood, String? core, double? length});
}

/// @nodoc
class __$$WandModelImplCopyWithImpl<$Res>
    extends _$WandModelCopyWithImpl<$Res, _$WandModelImpl>
    implements _$$WandModelImplCopyWith<$Res> {
  __$$WandModelImplCopyWithImpl(
      _$WandModelImpl _value, $Res Function(_$WandModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WandModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wood = freezed,
    Object? core = freezed,
    Object? length = freezed,
  }) {
    return _then(_$WandModelImpl(
      wood: freezed == wood
          ? _value.wood
          : wood // ignore: cast_nullable_to_non_nullable
              as String?,
      core: freezed == core
          ? _value.core
          : core // ignore: cast_nullable_to_non_nullable
              as String?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WandModelImpl implements _WandModel {
  _$WandModelImpl(
      {required this.wood, required this.core, required this.length});

  factory _$WandModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WandModelImplFromJson(json);

  @override
  final String? wood;
  @override
  final String? core;
  @override
  final double? length;

  @override
  String toString() {
    return 'WandModel(wood: $wood, core: $core, length: $length)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WandModelImpl &&
            (identical(other.wood, wood) || other.wood == wood) &&
            (identical(other.core, core) || other.core == core) &&
            (identical(other.length, length) || other.length == length));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, wood, core, length);

  /// Create a copy of WandModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WandModelImplCopyWith<_$WandModelImpl> get copyWith =>
      __$$WandModelImplCopyWithImpl<_$WandModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WandModelImplToJson(
      this,
    );
  }
}

abstract class _WandModel implements WandModel {
  factory _WandModel(
      {required final String? wood,
      required final String? core,
      required final double? length}) = _$WandModelImpl;

  factory _WandModel.fromJson(Map<String, dynamic> json) =
      _$WandModelImpl.fromJson;

  @override
  String? get wood;
  @override
  String? get core;
  @override
  double? get length;

  /// Create a copy of WandModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WandModelImplCopyWith<_$WandModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
