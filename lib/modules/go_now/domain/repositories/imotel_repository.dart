import 'package:guia_go/core/resources/resource.dart';
import 'package:guia_go/modules/go_now/data/models/motel_list_data_model.dart';

abstract class IMotelRepository {
  Future<Resource<MotelListDataModel, Exception>> getMotelList();
}
