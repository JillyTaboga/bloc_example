import 'package:dio/dio.dart';

import 'http_client.dart';

class DioHttpImplement implements HttpClient {
  final Dio dio = Dio();

  HttpResponse fromSuccess(Response response) {
    return HttpResponse(
      code: response.statusCode ?? 500,
      urlRequest: response.requestOptions.path,
      data: response.data,
    );
  }

  HttpResponse fromDioError(DioError e) {
    return HttpResponse(
      code: e.response?.statusCode ?? 500,
      urlRequest: e.response?.realUri.toString() ?? e.requestOptions.path,
      data: e.response?.data ?? {},
      errorMessage: e.message,
    );
  }

  @override
  Future<HttpResponse> get(
    String url, {
    Map<String, String>? query,
    Map<String, String>? headers,
  }) async {
    try {
      final result = await dio.get(
        url,
        queryParameters: query,
        options: Options(
          headers: headers,
        ),
      );
      return fromSuccess(result);
    } on DioError catch (e) {
      return fromDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> post(
    String url, {
    Map<String, String>? query,
    dynamic body,
    Map<String, String>? headers,
  }) async {
    try {
      final result = await dio.post(
        url,
        queryParameters: query,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      return fromSuccess(result);
    } on DioError catch (e) {
      return fromDioError(e);
    } catch (e) {
      rethrow;
    }
  }
}
