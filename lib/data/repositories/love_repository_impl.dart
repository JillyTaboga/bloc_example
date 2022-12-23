import 'dart:developer';
import 'dart:io';

import '../../core/failures.dart';
import '../../domain/entities/love_response.dart';
import '../../domain/entities/name_request.dart';
import '../../domain/repositories/love_repository.dart';
import '../data_sources/love_api.dart';

class LoveRepositoryImpl implements LoveRepository {
  LoveRepositoryImpl(this._loveApi);

  final LoveApi _loveApi;

  @override
  Future<Result<LoveResponse>> getLoveResponse(NameTest names) async {
    try {
      final result = await _loveApi.getLoveResponse(names);
      return right(result);
    } on SocketException catch (e, s) {
      return left(
        ConnectionsFailure(stackTrace: s),
      );
    } catch (e, s) {
      log(e.toString());
      return left(LoveResponseFailure(stackTrace: s));
    }
  }
}
