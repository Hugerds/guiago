import 'package:guia_go/core/http_client/data/implementation/http_client.dart';
import 'package:guia_go/core/http_client/domain/enums/type_http_client_enum.dart';
import 'package:guia_go/core/http_client/domain/interfaces/icustom_http_client.dart';
import 'package:guia_go/core/instance_manager/data/implementation/instance_manager.dart';

/// Custom http client implementation
ICustomHttpClient get customHttpClient => instanceManager.resolve<ICustomHttpClient>();

/// Initialize the http client with [Type] passed as parameter
void initHttpClient(TypeHttpClientEnum type) {
  switch (type) {
    case TypeHttpClientEnum.http:
      instanceManager.register<ICustomHttpClient>(HttpClient());
  }
}
