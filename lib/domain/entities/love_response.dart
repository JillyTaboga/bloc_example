import 'package:freezed_annotation/freezed_annotation.dart';

part 'love_response.freezed.dart';
part 'love_response.g.dart';

@freezed
class LoveResponse with _$LoveResponse {
  const factory LoveResponse({
    required String percentage,
    required String result,
  }) = _LoveResponse;

  factory LoveResponse.fromJson(Map<String, dynamic> json) =>
      _$LoveResponseFromJson(json);
}
