import '../packages/http_client.dart';
import 'translate_api.dart';

class TranslateGoogleApi implements TranslateApi {
  TranslateGoogleApi(this._client);

  final HttpClient _client;
  final _host = 'google-translate1.p.rapidapi.com';
  final _apiKey = const String.fromEnvironment('RAPIDAPIKEY');

  @override
  Future<String> translate(Pattern phrase) async {
    const url =
        'https://google-translate1.p.rapidapi.com/language/translate/v2';
    final body = {
      'q': phrase,
      'target': 'pt',
      'source': 'en',
    };

    final result = await _client.post(
      url,
      body: body,
      headers: {
        'content-type': 'application/x-www-form-urlencoded',
        'Accept-Encoding': 'application/gzip',
        'X-RapidAPI-Key': _apiKey,
        'X-RapidAPI-Host': _host,
      },
    );
    if (result.code == 200) {
      return result.data['data']['translations'][0]['translatedText'];
    } else {
      throw Exception(result.errorMessage);
    }
  }
}
