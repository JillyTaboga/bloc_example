import '../packages/http_client.dart';
import 'translate_api.dart';

class TranslateMyMemoryApi implements TranslateApi {
  TranslateMyMemoryApi(this._client);

  final HttpClient _client;
  final _host = 'translated-mymemory---translation-memory.p.rapidapi.com';
  final _apiKey = const String.fromEnvironment('RAPIDAPIKEY');

  @override
  Future<String> translate(String phrase) async {
    const url =
        'https://translated-mymemory---translation-memory.p.rapidapi.com/get';
    final Map<String, String> body = {
      'q': phrase,
      'langpair': 'en|pt',
    };

    final result = await _client.get(
      url,
      query: body,
      headers: {
        'X-RapidAPI-Key': _apiKey,
        'X-RapidAPI-Host': _host,
      },
    );
    if (result.code == 200) {
      return result.data['responseData']['translatedText'];
    } else {
      throw Exception(result.errorMessage);
    }
  }
}
