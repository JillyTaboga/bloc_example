import '../../core/failures.dart';
import '../entities/love_response.dart';
import '../entities/name_request.dart';
import '../repositories/love_repository.dart';

class GetLoveUseCase {
  GetLoveUseCase(this._loveRepository);
  final LoveRepository _loveRepository;

  Future<Result<LoveResponse>> call(NameTest names) async {
    return await _loveRepository.getLoveResponse(names);
  }
}
