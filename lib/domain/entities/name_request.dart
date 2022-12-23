import 'package:freezed_annotation/freezed_annotation.dart';

part 'name_request.freezed.dart';

@freezed
class NameTest with _$NameTest {
  const factory NameTest({
    required String sname,
    required String fname,
  }) = _NameTest;

  factory NameTest.fromJson(Map<String, dynamic> json) =>
      _$NameTestFromJson(json);
}
