import '../../domain/entities/love_response.dart';
import '../../domain/entities/name_request.dart';

abstract class LoveApi {
  Future<LoveResponse> getLoveResponse(NameTest names);
}
