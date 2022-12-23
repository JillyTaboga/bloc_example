// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'love_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoveResponse _$LoveResponseFromJson(Map<String, dynamic> json) {
  return _LoveResponse.fromJson(json);
}

/// @nodoc
mixin _$LoveResponse {
  String get percentage => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoveResponseCopyWith<LoveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoveResponseCopyWith<$Res> {
  factory $LoveResponseCopyWith(
          LoveResponse value, $Res Function(LoveResponse) then) =
      _$LoveResponseCopyWithImpl<$Res, LoveResponse>;
  @useResult
  $Res call({String percentage, String result});
}

/// @nodoc
class _$LoveResponseCopyWithImpl<$Res, $Val extends LoveResponse>
    implements $LoveResponseCopyWith<$Res> {
  _$LoveResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentage = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoveResponseCopyWith<$Res>
    implements $LoveResponseCopyWith<$Res> {
  factory _$$_LoveResponseCopyWith(
          _$_LoveResponse value, $Res Function(_$_LoveResponse) then) =
      __$$_LoveResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String percentage, String result});
}

/// @nodoc
class __$$_LoveResponseCopyWithImpl<$Res>
    extends _$LoveResponseCopyWithImpl<$Res, _$_LoveResponse>
    implements _$$_LoveResponseCopyWith<$Res> {
  __$$_LoveResponseCopyWithImpl(
      _$_LoveResponse _value, $Res Function(_$_LoveResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentage = null,
    Object? result = null,
  }) {
    return _then(_$_LoveResponse(
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoveResponse implements _LoveResponse {
  const _$_LoveResponse({required this.percentage, required this.result});

  factory _$_LoveResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LoveResponseFromJson(json);

  @override
  final String percentage;
  @override
  final String result;

  @override
  String toString() {
    return 'LoveResponse(percentage: $percentage, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoveResponse &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, percentage, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoveResponseCopyWith<_$_LoveResponse> get copyWith =>
      __$$_LoveResponseCopyWithImpl<_$_LoveResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoveResponseToJson(
      this,
    );
  }
}

abstract class _LoveResponse implements LoveResponse {
  const factory _LoveResponse(
      {required final String percentage,
      required final String result}) = _$_LoveResponse;

  factory _LoveResponse.fromJson(Map<String, dynamic> json) =
      _$_LoveResponse.fromJson;

  @override
  String get percentage;
  @override
  String get result;
  @override
  @JsonKey(ignore: true)
  _$$_LoveResponseCopyWith<_$_LoveResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
