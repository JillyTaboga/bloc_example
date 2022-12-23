import 'dart:developer';

Result<T> left<T>(Failure failure) {
  return Result.failure(failure);
}

Result<T> right<T>(T data) {
  return Result.success(data);
}

class Result<T> {
  final Failure? failure;
  final T? data;
  const Result._({
    this.failure,
    this.data,
  });
  factory Result.failure(Failure failure) => Result._(failure: failure);
  factory Result.success(T data) => Result._(data: data);

  Future<dynamic> fold({
    Function(Failure error)? onFailure,
    Function(T data)? onData,
  }) async {
    final realFailure = failure;
    if (onFailure != null && realFailure != null) {
      return await onFailure(realFailure);
    }
    final realData = data;
    if (onData != null && realData != null) {
      return await onData(realData);
    }
  }

  bool get wasSuccess => failure == null && data != null;
}

abstract class Failure {
  final StackTrace stackTrace;
  final String? message;
  Failure({
    required this.stackTrace,
    this.message,
  });

  @override
  String toString() {
    log(
      message ?? 'Unkown error',
      stackTrace: stackTrace,
      error: this,
      time: DateTime.now(),
    );
    return message ?? 'Unkown error';
  }
}

class LoveResponseFailure extends Failure {
  LoveResponseFailure({required super.stackTrace})
      : super(
          message: 'Não foi possível calcular a compatibilidade',
        );
}

class ConnectionsFailure extends Failure {
  ConnectionsFailure({required super.stackTrace})
      : super(
          message:
              'Conexão com o servidor indisponível, confira sua internet e tente novamente',
        );
}

class TranslateFailure extends Failure {
  TranslateFailure({required super.stackTrace})
      : super(
          message: 'Tradução indisponível',
        );
}
