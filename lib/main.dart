import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/data_sources/love_api.dart';
import 'data/data_sources/love_api_open_impl.dart';
import 'data/data_sources/translate_api.dart';
import 'data/data_sources/translate_api_google_impl.dart';
import 'data/packages/http_client.dart';
import 'data/packages/http_client_dio_impl.dart';
import 'data/repositories/love_repository_impl.dart';
import 'data/repositories/translate_repository_impl.dart';
import 'domain/repositories/love_repository.dart';
import 'domain/repositories/translation_repository.dart';
import 'domain/use_cases/get_love_use_case.dart';
import 'domain/use_cases/translate_use_case.dart';
import 'interface/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<HttpClient>(
            create: (_) => DioHttpImplement(),
          ),
          RepositoryProvider<LoveApi>(
            create: (context) => OpenApiLove(
              context.read<HttpClient>(),
            ),
          ),
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
          RepositoryProvider<TranslateApi>(
            create: (context) => TranslateGoogleApi(
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
