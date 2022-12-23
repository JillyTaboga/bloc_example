// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'name_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NameTest _$NameTestFromJson(Map<String, dynamic> json) {
  return _NameTest.fromJson(json);
}

/// @nodoc
mixin _$NameTest {
  String get sname => throw _privateConstructorUsedError;
  String get fname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameTestCopyWith<NameTest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameTestCopyWith<$Res> {
  factory $NameTestCopyWith(NameTest value, $Res Function(NameTest) then) =
      _$NameTestCopyWithImpl<$Res, NameTest>;
  @useResult
  $Res call({String sname, String fname});
}

/// @nodoc
class _$NameTestCopyWithImpl<$Res, $Val extends NameTest>
    implements $NameTestCopyWith<$Res> {
  _$NameTestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sname = null,
    Object? fname = null,
  }) {
    return _then(_value.copyWith(
      sname: null == sname
          ? _value.sname
          : sname // ignore: cast_nullable_to_non_nullable
              as String,
      fname: null == fname
          ? _value.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NameTestCopyWith<$Res> implements $NameTestCopyWith<$Res> {
  factory _$$_NameTestCopyWith(
          _$_NameTest value, $Res Function(_$_NameTest) then) =
      __$$_NameTestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sname, String fname});
}

/// @nodoc
class __$$_NameTestCopyWithImpl<$Res>
    extends _$NameTestCopyWithImpl<$Res, _$_NameTest>
    implements _$$_NameTestCopyWith<$Res> {
  __$$_NameTestCopyWithImpl(
      _$_NameTest _value, $Res Function(_$_NameTest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sname = null,
    Object? fname = null,
  }) {
    return _then(_$_NameTest(
      sname: null == sname
          ? _value.sname
          : sname // ignore: cast_nullable_to_non_nullable
              as String,
      fname: null == fname
          ? _value.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NameTest implements _NameTest {
  const _$_NameTest({required this.sname, required this.fname});

  factory _$_NameTest.fromJson(Map<String, dynamic> json) =>
      _$$_NameTestFromJson(json);

  @override
  final String sname;
  @override
  final String fname;

  @override
  String toString() {
    return 'NameTest(sname: $sname, fname: $fname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NameTest &&
            (identical(other.sname, sname) || other.sname == sname) &&
            (identical(other.fname, fname) || other.fname == fname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sname, fname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NameTestCopyWith<_$_NameTest> get copyWith =>
      __$$_NameTestCopyWithImpl<_$_NameTest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NameTestToJson(
      this,
    );
  }
}

abstract class _NameTest implements NameTest {
  const factory _NameTest(
      {required final String sname, required final String fname}) = _$_NameTest;

  factory _NameTest.fromJson(Map<String, dynamic> json) = _$_NameTest.fromJson;

  @override
  String get sname;
  @override
  String get fname;
  @override
  @JsonKey(ignore: true)
  _$$_NameTestCopyWith<_$_NameTest> get copyWith =>
      throw _privateConstructorUsedError;
}
