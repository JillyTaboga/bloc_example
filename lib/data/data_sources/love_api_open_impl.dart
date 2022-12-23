import '../../domain/entities/love_response.dart';
import '../../domain/entities/name_request.dart';
import '../packages/http_client.dart';
import 'love_api.dart';

class OpenApiLove implements LoveApi {
  const OpenApiLove(this._client);
  final HttpClient _client;
  final _url = 'https://love-calculator.p.rapidapi.com/getPercentage';
  final _host = 'love-calculator.p.rapidapi.com';
  final _apiKey = const String.fromEnvironment('RAPIDAPIKEY');

  @override
  Future<LoveResponse> getLoveResponse(NameTest names) async {
    final response = await _client.get(
      _url,
      query: {
        'sname': names.sname,
        'fname': names.fname,
      },
      headers: {
        'X-RapidAPI-Key': _apiKey,
        'X-RapidAPI-Host': _host,
      },
    );
    if (response.code == 200) {
      return LoveResponse.fromJson(response.data);
    } else {
      throw Exception(response.errorMessage);
    }
  }
}
