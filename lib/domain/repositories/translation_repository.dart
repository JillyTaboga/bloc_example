import '../../core/failures.dart';

abstract class TranslateRepository {
  Future<Result<String>> translate(String phrase);
}
