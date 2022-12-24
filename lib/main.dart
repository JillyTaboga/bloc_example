import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/data_sources/love_api.dart';
import 'data/data_sources/love_api_open_impl.dart';
import 'data/data_sources/translate_api.dart';
import 'data/data_sources/translate_api_microsoft_impl.dart';
import 'data/packages/http_client.dart';
import 'data/packages/http_client_dio_impl.dart';
import 'data/repositories/love_repository_impl.dart';
import 'data/repositories/translate_repository_impl.dart';
import 'domain/repositories/love_repository.dart';
import 'domain/repositories/translation_repository.dart';
import 'domain/use_cases/get_love_use_case.dart';
import 'domain/use_cases/translate_use_case.dart';
import 'interface/screens/home_screen.dart';

//Para o app funcionar é preciso que você defina via Dart-Define uma variável
//RAPIDAPIKEY com sua Api-key da RapidApi

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //Realiza a Injeção de dependencias
      home: MultiRepositoryProvider(
        providers: [
          //Optei por fazer uma classe genérica para o Http Cliente para permitir
          //o desacoplamento do package Dio caso um dia opte pela troca, claro que
          //para este projeto a implementação é bem simplória somente com os métodos
          //necessários que seria utilizados, mas em projetos mais complexos seria
          //necessário uma implementação mais robustas com outros verbos e configurações
          RepositoryProvider<HttpClient>(
            create: (_) => DioHttpImplement(),
          ),
          RepositoryProvider<LoveApi>(
            create: (context) => OpenApiLove(
              context.read<HttpClient>(),
            ),
          ),
          //A separação de Repositorios com interfaces tem como objetivo possibilitar
          //uma controle fino dos tipos de falhas que um data source pode emitir
          //ou seja, ao substituir uma implementação por outro se poderia alterar
          //as falhas emitidas por um repositorio, contudo na prática pouco se tem
          //visto reais necessidades dessa separação de forma que em projeto mais
          //novos muitos tem optado por se ter um repositório concreto desde o início
          RepositoryProvider<LoveRepository>(
            create: (context) => LoveRepositoryImpl(
              context.read<LoveApi>(),
            ),
          ),
          RepositoryProvider<GetLoveUseCase>(
            create: (context) => GetLoveUseCase(
              context.read<LoveRepository>(),
            ),
          ),
          //Exemplo de como seria substituir um servidor de tradução por outro
          //de maneira simples graças a separação de dependencias e utilização
          //de abstracts para a interface
          //Nesse projeto existem três provedores de tradução:
          //- TranslateMicrosoftApi
          //- TranslateGoogleApi
          //- TranslateMyMemoryApi
          RepositoryProvider<TranslateApi>(
            create: (context) => TranslateMicrosoftApi(
              context.read<HttpClient>(),
            ),
          ),
          RepositoryProvider<TranslateRepository>(
            create: (context) => TranslateRepositoryImpl(
              context.read<TranslateApi>(),
            ),
          ),
          RepositoryProvider<TranslateUseCase>(
            create: (context) => TranslateUseCase(
              context.read<TranslateRepository>(),
            ),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
