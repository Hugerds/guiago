import 'package:guia_go/modules/go_now/data/models/motel_list_data_model.dart';
import 'package:guia_go/modules/go_now/domain/repositories/imotel_repository.dart';

abstract class IGetMotelsGoNowUseCase {
  Future<MotelListDataModel> call();
}

class GetMotelsGoNowUseCase implements IGetMotelsGoNowUseCase {
  GetMotelsGoNowUseCase(this._motelRepository);

  late final IMotelRepository _motelRepository;

  @override
  Future<MotelListDataModel> call() async {
    final motelList = await _motelRepository.getMotelList();
    if (motelList.data == null) {
      throw Exception('Erro ao buscar');
    }
    return motelList.data!;
  }
}
