abstract class HttpClient {
  Future<HttpResponse> get(
    String url, {
    Map<String, String>? query,
    Map<String, String>? headers,
  });
  Future<HttpResponse> post(
    String url, {
    Map<String, String>? query,
    dynamic body,
    Map<String, String>? headers,
  });
}

class HttpResponse {
  final int code;
  final String urlRequest;
  final String? errorMessage;
  final dynamic data;
  HttpResponse({
    required this.code,
    required this.urlRequest,
    this.errorMessage,
    required this.data,
  });
}
