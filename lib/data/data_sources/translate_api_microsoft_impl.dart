import '../packages/http_client.dart';
import 'translate_api.dart';

class TranslateMicrosoftApi implements TranslateApi {
  TranslateMicrosoftApi(this._client);

  final HttpClient _client;
  final _host = 'microsoft-translator-text.p.rapidapi.com';
  final _apiKey = const String.fromEnvironment('RAPIDAPIKEY');

  @override
  Future<String> translate(String phrase) async {
    const url = 'https://microsoft-translator-text.p.rapidapi.com/translate';
    final Map<String, String> body = {
      'to[0]': 'pt',
      'api-version': '3.0',
    };

    final result = await _client.post(
      url,
      query: body,
      body: [
        {'Text': phrase}
      ],
      headers: {
        'content-type': 'application/json',
        'X-RapidAPI-Key': _apiKey,
        'X-RapidAPI-Host': _host,
      },
    );
    if (result.code == 200) {
      final translations = result.data[0]['translations'];
      final translation = translations[0]['text'];
      return translation;
    } else {
      throw Exception(result.errorMessage);
    }
  }
}
