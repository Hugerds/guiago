import 'package:guia_go/core/instance_manager/data/implementation/instance_manager.dart';
import 'package:guia_go/modules/go_now/data/data_sources/motel_remote_data_source.dart';
import 'package:guia_go/modules/go_now/data/repositories/motel_repository.dart';
import 'package:guia_go/modules/go_now/domain/repositories/imotel_repository.dart';

void initRepositories() {
  instanceManager.register<IMotelRepository>(MotelRepository(instanceManager.resolve<IMotelRemoteDataSource>()));
}
