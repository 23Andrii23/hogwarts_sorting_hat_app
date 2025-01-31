// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_page.controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainPageState {
  CharacterInfo get characterInfo => throw _privateConstructorUsedError;
  int get totalAttempts => throw _privateConstructorUsedError;
  int get successAttempts => throw _privateConstructorUsedError;
  int get failedAttempts => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainPageStateCopyWith<MainPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainPageStateCopyWith<$Res> {
  factory $MainPageStateCopyWith(
          MainPageState value, $Res Function(MainPageState) then) =
      _$MainPageStateCopyWithImpl<$Res, MainPageState>;
  @useResult
  $Res call(
      {CharacterInfo characterInfo,
      int totalAttempts,
      int successAttempts,
      int failedAttempts,
      String? imageUrl});

  $CharacterInfoCopyWith<$Res> get characterInfo;
}

/// @nodoc
class _$MainPageStateCopyWithImpl<$Res, $Val extends MainPageState>
    implements $MainPageStateCopyWith<$Res> {
  _$MainPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterInfo = null,
    Object? totalAttempts = null,
    Object? successAttempts = null,
    Object? failedAttempts = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      characterInfo: null == characterInfo
          ? _value.characterInfo
          : characterInfo // ignore: cast_nullable_to_non_nullable
              as CharacterInfo,
      totalAttempts: null == totalAttempts
          ? _value.totalAttempts
          : totalAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      successAttempts: null == successAttempts
          ? _value.successAttempts
          : successAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      failedAttempts: null == failedAttempts
          ? _value.failedAttempts
          : failedAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CharacterInfoCopyWith<$Res> get characterInfo {
    return $CharacterInfoCopyWith<$Res>(_value.characterInfo, (value) {
      return _then(_value.copyWith(characterInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MainPageStateImplCopyWith<$Res>
    implements $MainPageStateCopyWith<$Res> {
  factory _$$MainPageStateImplCopyWith(
          _$MainPageStateImpl value, $Res Function(_$MainPageStateImpl) then) =
      __$$MainPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CharacterInfo characterInfo,
      int totalAttempts,
      int successAttempts,
      int failedAttempts,
      String? imageUrl});

  @override
  $CharacterInfoCopyWith<$Res> get characterInfo;
}

/// @nodoc
class __$$MainPageStateImplCopyWithImpl<$Res>
    extends _$MainPageStateCopyWithImpl<$Res, _$MainPageStateImpl>
    implements _$$MainPageStateImplCopyWith<$Res> {
  __$$MainPageStateImplCopyWithImpl(
      _$MainPageStateImpl _value, $Res Function(_$MainPageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characterInfo = null,
    Object? totalAttempts = null,
    Object? successAttempts = null,
    Object? failedAttempts = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$MainPageStateImpl(
      characterInfo: null == characterInfo
          ? _value.characterInfo
          : characterInfo // ignore: cast_nullable_to_non_nullable
              as CharacterInfo,
      totalAttempts: null == totalAttempts
          ? _value.totalAttempts
          : totalAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      successAttempts: null == successAttempts
          ? _value.successAttempts
          : successAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      failedAttempts: null == failedAttempts
          ? _value.failedAttempts
          : failedAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MainPageStateImpl
    with DiagnosticableTreeMixin
    implements _MainPageState {
  const _$MainPageStateImpl(
      {required this.characterInfo,
      required this.totalAttempts,
      required this.successAttempts,
      required this.failedAttempts,
      this.imageUrl});

  @override
  final CharacterInfo characterInfo;
  @override
  final int totalAttempts;
  @override
  final int successAttempts;
  @override
  final int failedAttempts;
  @override
  final String? imageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainPageState(characterInfo: $characterInfo, totalAttempts: $totalAttempts, successAttempts: $successAttempts, failedAttempts: $failedAttempts, imageUrl: $imageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MainPageState'))
      ..add(DiagnosticsProperty('characterInfo', characterInfo))
      ..add(DiagnosticsProperty('totalAttempts', totalAttempts))
      ..add(DiagnosticsProperty('successAttempts', successAttempts))
      ..add(DiagnosticsProperty('failedAttempts', failedAttempts))
      ..add(DiagnosticsProperty('imageUrl', imageUrl));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainPageStateImpl &&
            (identical(other.characterInfo, characterInfo) ||
                other.characterInfo == characterInfo) &&
            (identical(other.totalAttempts, totalAttempts) ||
                other.totalAttempts == totalAttempts) &&
            (identical(other.successAttempts, successAttempts) ||
                other.successAttempts == successAttempts) &&
            (identical(other.failedAttempts, failedAttempts) ||
                other.failedAttempts == failedAttempts) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, characterInfo, totalAttempts,
      successAttempts, failedAttempts, imageUrl);

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MainPageStateImplCopyWith<_$MainPageStateImpl> get copyWith =>
      __$$MainPageStateImplCopyWithImpl<_$MainPageStateImpl>(this, _$identity);
}

abstract class _MainPageState implements MainPageState {
  const factory _MainPageState(
      {required final CharacterInfo characterInfo,
      required final int totalAttempts,
      required final int successAttempts,
      required final int failedAttempts,
      final String? imageUrl}) = _$MainPageStateImpl;

  @override
  CharacterInfo get characterInfo;
  @override
  int get totalAttempts;
  @override
  int get successAttempts;
  @override
  int get failedAttempts;
  @override
  String? get imageUrl;

  /// Create a copy of MainPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MainPageStateImplCopyWith<_$MainPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
