import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:guia_go/core/instance_manager/data/implementation/instance_manager.dart';
import 'package:guia_go/core/instance_manager/domain/enums/type_instance_manager_enum.dart';
import 'package:guia_go/core/instance_manager/domain/interfaces/iinstance_manager.dart';

/// Initialize the instance manager with GetIt
void initInstanceManagerWithGetIt() {
  return initInstanceManager(TypeInstanceManagerEnum.getIt);
}

/// Implementation of [IInstanceManager] using GetIt
class GetItInstanceManager implements IInstanceManager {
  GetItInstanceManager() {
    instanceManager = GetIt.instance;
  }
  late final GetIt instanceManager;

  /// Dispose the instance manager
  @override
  Future<void> dispose() async {
    log('GetItInstanceManager dispose');
    await instanceManager.reset();
  }

  /// Register a instance
  @override
  Future<void> register<T extends Object>(T instance) async {
    log('GetItInstanceManager register $instance');
    instanceManager.registerSingleton<T>(instance);
  }

  /// Unregister a instance
  @override
  Future<void> unregister<T extends Object>() async {
    log('GetItInstanceManager unregister $T');
    instanceManager.unregister<T>();
  }

  /// Get a instance
  @override
  T resolve<T extends Object>() {
    log('GetItInstanceManager resolve $T');
    return instanceManager.get<T>();
  }

  /// Get a instance with parameters
  @override
  Future<T> resolveWithParams<T extends Object>(Map<String, dynamic> params) async {
    log('GetItInstanceManager resolveWithParams $T');
    return instanceManager.get<T>(param1: params);
  }

  /// Clear the instance manager
  @override
  Future<void> clear() async {
    log('GetItInstanceManager clear');
    await instanceManager.reset();
  }
}
