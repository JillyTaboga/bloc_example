import '../../core/failures.dart';
import '../repositories/translation_repository.dart';

class TranslateUseCase {
  TranslateUseCase(this._repository);
  final TranslateRepository _repository;

  Future<Result<String>> call(String phrase) async {
    return await _repository.translate(phrase);
  }
}
