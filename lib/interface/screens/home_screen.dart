import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/name_request.dart';
import '../../domain/use_cases/get_love_use_case.dart';
import '../../domain/use_cases/translate_use_case.dart';
import 'home_controller.dart';
import 'translation_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (_) => NamesCubit(),
          child: BlocBuilder<NamesCubit, NameTest>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, names) {
              return Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Teste sua compatibilidade amorosa',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (value) {
                        context.read<NamesCubit>().changeSName(value);
                      },
                      decoration: const InputDecoration(
                        label: Text('Seu nome:'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (value) {
                        context.read<NamesCubit>().changeFName(value);
                      },
                      decoration: const InputDecoration(
                        label: Text('Nome do seu par:'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocProvider(
                      create: (context) => HomeStateCubit(
                        context.read<GetLoveUseCase>(),
                      ),
                      child: BlocBuilder<HomeStateCubit, HomeState>(
                        builder: (context, state) => HomeStateWidget(
                          names: names,
                          state: state,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HomeStateWidget extends StatelessWidget {
  const HomeStateWidget({
    super.key,
    required this.names,
    required this.state,
  });

  final NameTest names;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    save() {
      context.read<HomeStateCubit>().save(
            names,
          );
    }

    return state.when(
      initial: () => ElevatedButton(
        onPressed: save,
        child: const Text('Arriscar'),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      result: (result) {
        return ResultWidget(
          percent: result.percentage,
          phrase: result.result,
          onTap: save,
        );
      },
      error: (error) {
        return LoveErrorWidget(
          message: error.message,
          onTap: save,
        );
      },
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    Key? key,
    required this.percent,
    required this.phrase,
    required this.onTap,
  }) : super(key: key);

  final String percent;
  final String phrase;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Chance de sucesso: $percent%'),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<TranslationCubit, TranslationState>(
          bloc: TranslationCubit(
            context.read<TranslateUseCase>(),
            phrase,
          ),
          builder: (context, state) {
            return state.when(
              loading: () => const Text('...'),
              result: (result) => Text(result),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: onTap,
          child: const Text('Consigo melhor'),
        ),
      ],
    );
  }
}

class LoveErrorWidget extends StatelessWidget {
  const LoveErrorWidget({
    Key? key,
    this.message,
    required this.onTap,
  }) : super(
          key: key,
        );

  final String? message;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(message ?? 'Erro Desconhecido'),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: onTap,
          child: const Text('Tentar novamente'),
        ),
      ],
    );
  }
}
