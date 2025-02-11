import 'package:guia_go/core/instance_manager/data/implementation/instance_manager.dart';
import 'package:guia_go/modules/go_now/domain/repositories/imotel_repository.dart';
import 'package:guia_go/modules/go_now/domain/use_cases/get_motels_go_now_use_case.dart';

void initUseCases() {
  instanceManager.register<IGetMotelsGoNowUseCase>(GetMotelsGoNowUseCase(instanceManager.resolve<IMotelRepository>()));
}
