import 'package:guia_go/core/resources/resource.dart';
import 'package:guia_go/modules/go_now/data/data_sources/motel_remote_data_source.dart';
import 'package:guia_go/modules/go_now/data/models/motel_list_data_model.dart';
import 'package:guia_go/modules/go_now/domain/repositories/imotel_repository.dart';
import 'package:guia_go/modules/shared/data/dtos/base_response_dto.dart';

class MotelRepository implements IMotelRepository {
  MotelRepository(this._motelRemoteDataSource);

  late final IMotelRemoteDataSource _motelRemoteDataSource;

  @override
  Future<Resource<MotelListDataModel, Exception>> getMotelList() async {
    try {
      final motelList = await _motelRemoteDataSource.getMotelList();
      if (motelList.isEmpty) {
        return Resource.failed(error: Exception('Empty response'));
      }
      final motelListFormatted =
          BaseResponseDTO.fromJson(motelList, (json) => MotelListDataModel.fromJson(json! as Map<String, dynamic>));
      return Resource.success(data: motelListFormatted.data);
    } on Exception catch (e) {
      return Resource.failed(error: e);
    }
  }
}
