import 'package:guia_go/core/http_client/domain/interfaces/icustom_http_client.dart';
import 'package:guia_go/core/instance_manager/data/implementation/instance_manager.dart';
import 'package:guia_go/modules/go_now/data/data_sources/motel_remote_data_source.dart';

void initDataSources() {
  instanceManager.register<IMotelRemoteDataSource>(MotelRemoteDataSource(instanceManager.resolve<ICustomHttpClient>()));
}
