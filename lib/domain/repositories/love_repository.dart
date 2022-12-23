import '../../core/failures.dart';
import '../entities/love_response.dart';
import '../entities/name_request.dart';

abstract class LoveRepository {
  Future<Result<LoveResponse>> getLoveResponse(NameTest names);
}
