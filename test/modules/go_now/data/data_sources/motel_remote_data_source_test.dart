import 'package:flutter_test/flutter_test.dart';
import 'package:guia_go/core/http_client/domain/interfaces/icustom_http_client.dart';
import 'package:guia_go/core/instance_manager/domain/interfaces/iinstance_manager.dart';
import 'package:guia_go/modules/go_now/data/data_sources/motel_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([ICustomHttpClient, IInstanceManager])
import 'motel_remote_data_source_test.mocks.dart';

void main() {
  late MotelRemoteDataSource dataSource;
  late MockICustomHttpClient mockHttpClient;
  late MockIInstanceManager mockInstanceManager;
  setUpAll(() {
    provideDummy<ICustomHttpClient>(MockICustomHttpClient());
  });

  setUp(() {
    mockInstanceManager = MockIInstanceManager();
    mockHttpClient = MockICustomHttpClient();
    when(mockInstanceManager.resolve<ICustomHttpClient>()).thenReturn(mockHttpClient);
    dataSource = MotelRemoteDataSource(mockHttpClient);
  });

  test('Deve chamar a API e retornar um Map<String, dynamic>', () async {
    final fakeResponse = {
      'data': {'moteis': <dynamic>[]},
    };

    when(mockHttpClient.get(any)).thenAnswer((_) async => fakeResponse);

    final result = await dataSource.getMotelList();

    expect(result, isA<Map<String, dynamic>>());
    verify(mockHttpClient.get('1IXK')).called(1);
  });

  test('Deve lançar exceção quando a API falha', () async {
    when(mockHttpClient.get(any)).thenThrow(Exception('Erro de conexão'));

    expect(() => dataSource.getMotelList(), throwsA(isA<Exception>()));
    verify(mockHttpClient.get('1IXK')).called(1);
  });
}
