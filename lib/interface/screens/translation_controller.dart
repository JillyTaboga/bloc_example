import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/use_cases/translate_use_case.dart';

part 'translation_controller.freezed.dart';

@freezed
class TranslationState with _$TranslationState {
  const factory TranslationState.loading() = _Loading;
  const factory TranslationState.result(String result) = _result;
}

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit(this._translateUseCase, String phrase)
      : super(const TranslationState.loading()) {
    translate(phrase);
  }

  final TranslateUseCase _translateUseCase;

  translate(String phrase) async {
    emit(const TranslationState.loading());
    final result = await _translateUseCase(phrase);
    result.fold(
      onFailure: (error) => emit(TranslationState.result(phrase)),
      onData: (data) => emit(TranslationState.result(data)),
    );
  }
}
