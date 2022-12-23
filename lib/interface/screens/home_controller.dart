import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/failures.dart';
import '../../domain/entities/love_response.dart';
import '../../domain/entities/name_request.dart';
import '../../domain/use_cases/get_love_use_case.dart';

part 'home_controller.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.result(LoveResponse response) = _Result;
  const factory HomeState.error(Failure error) = _Error;
}

class HomeStateCubit extends Cubit<HomeState> {
  HomeStateCubit(this._getLoveUseCase) : super(const HomeState.initial());

  final GetLoveUseCase _getLoveUseCase;

  save(NameTest names) async {
    emit(const HomeState.loading());
    final result = await _getLoveUseCase(names);
    result.fold(
      onFailure: (error) => emit(HomeState.error(error)),
      onData: (data) => emit(HomeState.result(data)),
    );
  }
}

class NamesCubit extends Cubit<NameTest> {
  NamesCubit()
      : super(
          const NameTest(
            sname: '',
            fname: '',
          ),
        );

  changeSName(String name) {
    emit(state.copyWith(sname: name));
  }

  changeFName(String name) {
    emit(state.copyWith(fname: name));
  }
}
