import 'package:flutter_test/flutter_test.dart';
import 'package:guia_go/modules/go_now/data/data_sources/motel_remote_data_source.dart';
import 'package:guia_go/modules/go_now/data/models/motel_list_data_model.dart';
import 'package:guia_go/modules/go_now/data/repositories/motel_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([IMotelRemoteDataSource])
import 'motel_repository_test.mocks.dart';

void main() {
  late MotelRepository repository;
  late MockIMotelRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockIMotelRemoteDataSource();
    repository = MotelRepository(mockDataSource);
  });

  test('Deve retornar sucesso quando o data source retorna dados', () async {
    final fakeResponse = {
      'data': {
        'moteis': <dynamic>[
          {
            'fantasia': 'Teste',
            'logo': 'Teste',
            'bairro': 'Teste',
            'distancia': 1,
            'qtdFavoritos': 1,
            'suites': <dynamic>[],
            'qtdAvaliacoes': 1,
            'media': 1.0,
          }
        ],
      },
    };

    when(mockDataSource.getMotelList()).thenAnswer((_) async => fakeResponse);

    final result = await repository.getMotelList();

    expect(result.success, true);
    expect(result.data, isA<MotelListDataModel>());
    verify(mockDataSource.getMotelList()).called(1);
  });

  test('Deve retornar erro quando o data source falha', () async {
    when(mockDataSource.getMotelList()).thenThrow(Exception('Falha na API'));

    final result = await repository.getMotelList();

    expect(result.success, false);
    expect(result.error, isA<Exception>());
    verify(mockDataSource.getMotelList()).called(1);
  });

  test('Deve retornar erro quando a resposta da API está vazia', () async {
    when(mockDataSource.getMotelList()).thenAnswer((_) async => {});

    final result = await repository.getMotelList();

    expect(result.success, false);
    expect(result.error, isA<Exception>());
    verify(mockDataSource.getMotelList()).called(1);
  });
}
