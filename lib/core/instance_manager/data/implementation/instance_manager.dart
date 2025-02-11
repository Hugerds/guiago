import 'package:guia_go/core/instance_manager/data/implementation/get_it_instance_manager.dart';
import 'package:guia_go/core/instance_manager/domain/enums/type_instance_manager_enum.dart';
import 'package:guia_go/core/instance_manager/domain/interfaces/iinstance_manager.dart';

/// Instance manager to be used in the application
late final IInstanceManager instanceManager;

/// Initialize the instance manager with [Type] passed as parameter
void initInstanceManager(TypeInstanceManagerEnum type) {
  switch (type) {
    case TypeInstanceManagerEnum.getIt:
      instanceManager = GetItInstanceManager();
  }
}
