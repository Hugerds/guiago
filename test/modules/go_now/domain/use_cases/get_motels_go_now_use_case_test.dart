import 'package:flutter_test/flutter_test.dart';
import 'package:guia_go/core/resources/resource.dart';
import 'package:guia_go/modules/go_now/data/models/motel_list_data_model.dart';
import 'package:guia_go/modules/go_now/domain/repositories/imotel_repository.dart';
import 'package:guia_go/modules/go_now/domain/use_cases/get_motels_go_now_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([IMotelRepository])
import 'get_motels_go_now_use_case_test.mocks.dart';

void main() {
  late GetMotelsGoNowUseCase useCase;
  late MockIMotelRepository mockRepository;

  setUp(() {
    mockRepository = MockIMotelRepository();
    useCase = GetMotelsGoNowUseCase(mockRepository);
  });

  test('Deve retornar MotelListDataModel quando o repositório retornar sucesso', () async {
    final motelListData = MotelListDataModel(moteis: []);
    final resource = Resource.success(data: motelListData, error: Exception());

    when(mockRepository.getMotelList()).thenAnswer((_) async => resource);

    final result = await useCase.call();

    expect(result, motelListData);
    verify(mockRepository.getMotelList()).called(1);
  });

  test('Deve lançar uma exceção quando o repositório retornar erro', () async {
    final resource = Resource<MotelListDataModel, Exception>.failed(error: Exception('Erro ao buscar'));

    when(mockRepository.getMotelList()).thenAnswer((_) async => resource);

    expect(
      () async => useCase.call(),
      throwsA(isA<Exception>()),
    );

    verify(mockRepository.getMotelList()).called(1);
  });
}
