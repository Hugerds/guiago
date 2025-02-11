import 'package:guia_go/core/di/data_sources_di.dart';
import 'package:guia_go/core/di/repositories_di.dart';
import 'package:guia_go/core/di/use_cases_di.dart';

void initInstances() {
  initDataSources();
  initRepositories();
  initUseCases();
}
