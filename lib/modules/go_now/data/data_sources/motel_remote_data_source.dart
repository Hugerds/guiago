import 'package:guia_go/core/http_client/domain/interfaces/icustom_http_client.dart';

abstract class IMotelRemoteDataSource {
  Future<Map<String, dynamic>> getMotelList();
}

class MotelRemoteDataSource implements IMotelRemoteDataSource {
  MotelRemoteDataSource(this._client);

  late final ICustomHttpClient _client;

  @override
  Future<Map<String, dynamic>> getMotelList() async {
    final response = await _client.get('1IXK');
    return response as Map<String, dynamic>;
  }
}
