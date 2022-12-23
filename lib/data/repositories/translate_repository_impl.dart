import 'dart:developer';
import 'dart:io';

import '../../core/failures.dart';
import '../../domain/repositories/translation_repository.dart';
import '../data_sources/translate_api.dart';

class TranslateRepositoryImpl implements TranslateRepository {
  TranslateRepositoryImpl(this._api);
  final TranslateApi _api;

  @override
  Future<Result<String>> translate(String phrase) async {
    try {
      final result = await _api.translate(phrase);
      return right(result);
    } on SocketException catch (e, s) {
      return left(
        ConnectionsFailure(stackTrace: s),
      );
    } catch (e, s) {
      log(e.toString());
      return left(TranslateFailure(stackTrace: s));
    }
  }
}
