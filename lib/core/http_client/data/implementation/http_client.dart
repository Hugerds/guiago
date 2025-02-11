import 'dart:convert';
import 'package:guia_go/core/constants/services.dart';
import 'package:guia_go/core/http_client/data/implementation/custom_http_client.dart';
import 'package:guia_go/core/http_client/domain/enums/type_http_client_enum.dart';
import 'package:guia_go/core/http_client/domain/interfaces/icustom_http_client.dart';
import 'package:http/http.dart' as http;

/// Initialize the http client with Http
void initInstanceManagerWithHttp() {
  return initHttpClient(TypeHttpClientEnum.http);
}

class HttpClient implements ICustomHttpClient {
  HttpClient({http.Client? client}) : _client = client ?? http.Client();
  final http.Client _client;

  @override
  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    headers ??= <String, String>{};
    final response = await _client.get(Uri.parse(baseUrlApi + url), headers: headers);
    return _handleResponse(response);
  }

  @override
  Future<dynamic> post(String url, {Map<String, String>? headers, dynamic body}) async {
    headers ??= <String, String>{};
    if (body != null) {
      headers
        ..addAll({'Content-Type': 'application/json'})
        ..addAll({'Accept': 'application/json'});
    }
    final response =
        await _client.post(Uri.parse(baseUrlApi + url), headers: headers, body: body != null ? jsonEncode(body) : null);
    return _handleResponse(response);
  }

  @override
  Future<dynamic> put(String url, {Map<String, String>? headers, dynamic body}) async {
    headers ??= <String, String>{};
    if (body != null) {
      headers
        ..addAll({'Content-Type': 'application/json'})
        ..addAll({'Accept': 'application/json'});
    }
    final response =
        await _client.put(Uri.parse(baseUrlApi + url), headers: headers, body: body != null ? jsonEncode(body) : null);
    return _handleResponse(response);
  }

  @override
  Future<dynamic> delete(String url, {Map<String, String>? headers}) async {
    headers ??= <String, String>{};
    final response = await _client.delete(Uri.parse(baseUrlApi + url), headers: headers);
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final decodedBody = utf8.decode(response.bodyBytes);
        return jsonDecode(decodedBody);
      } on Exception catch (_) {
        return response.body;
      }
    } else {
      throw Exception('Erro na requisição: ${response.statusCode}');
    }
  }
}
