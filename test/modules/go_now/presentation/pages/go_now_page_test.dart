import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_go/core/measurements/measurements.dart';
import 'package:guia_go/modules/go_now/data/models/discount_model.dart';
import 'package:guia_go/modules/go_now/data/models/item_category.dart';
import 'package:guia_go/modules/go_now/data/models/motel_model.dart';
import 'package:guia_go/modules/go_now/data/models/suite_item_model.dart';
import 'package:guia_go/modules/go_now/data/models/suite_model.dart';
import 'package:guia_go/modules/go_now/data/models/suite_period_model.dart';
import 'package:guia_go/modules/go_now/presentation/pages/go_now_page.dart';
import 'package:guia_go/modules/go_now/presentation/providers/go_now_provider.dart';
import 'package:guia_go/modules/go_now/presentation/widgets/shimmer_widget.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'go_now_page_test.mocks.dart';

@GenerateMocks([GoNowProvider])
void main() {
  late MockGoNowProvider mockProvider;
  setUpAll(() => HttpOverrides.global = null);

  setUp(() {
    mockProvider = MockGoNowProvider();

    when(mockProvider.isLoading).thenReturn(false);
    when(mockProvider.motelList).thenReturn([
      MotelModel(
        fantasia: 'Motel 1',
        logo: 'https://fakeimg.pl/600x400',
        bairro: 'sao paulo',
        distancia: 1,
        qtdFavoritos: 1,
        suites: [
          SuiteModel(
            nome: 'Suite 1',
            categoriaItens: [
              ItemCategoryModel(nome: 'Teste'),
            ],
            exibirQtdDisponiveis: true,
            fotos: [
              'https://fakeimg.pl/600x400',
            ],
            itens: [
              SuiteItemModel(nome: 'Teste'),
            ],
            periodos: [
              SuitePeriodModel(
                tempo: '2',
                tempoFormatado: '2 Horas',
                valor: 80,
                valorTotal: 80,
              ),
            ],
            qtd: 1,
          ),
        ],
        qtdAvaliacoes: 1,
        media: 1,
      ),
    ]);
    when(mockProvider.motelWithDiscountList).thenReturn([
      MotelModel(
        fantasia: 'Motel 2',
        logo: 'https://fakeimg.pl/600x400',
        bairro: 'cajamar',
        distancia: 1,
        qtdFavoritos: 1,
        suites: [
          SuiteModel(
            nome: 'Suite 1',
            categoriaItens: [
              ItemCategoryModel(nome: 'Teste'),
            ],
            exibirQtdDisponiveis: true,
            fotos: [
              'https://fakeimg.pl/600x400',
            ],
            itens: [
              SuiteItemModel(nome: 'Teste'),
            ],
            periodos: [
              SuitePeriodModel(
                tempo: '2',
                tempoFormatado: '2 Horas',
                valor: 80,
                valorTotal: 80,
                desconto: DiscountModel(desconto: 30),
              ),
            ],
            qtd: 1,
          ),
        ],
        qtdAvaliacoes: 1,
        media: 1,
      ),
    ]);
  });

  testWidgets('GoNowPage exibe lista de motéis', (tester) async {
    when(mockProvider.isLoading).thenReturn(false);

    await tester.runAsync(
      () async => tester.pumpWidget(
        ChangeNotifierProvider<GoNowProvider>(
          create: (_) => mockProvider,
          builder: (context, _) {
            initMeasurements(context);
            return const MaterialApp(home: GoNowPage());
          },
        ),
      ),
    );
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(seconds: 1));
    }

    expect(find.text('zona sul'), findsOneWidget);

    expect(find.text('Motel 1'), findsOneWidget);
  });
  testWidgets('GoNowPage mostra shimmer quando carregando', (tester) async {
    when(mockProvider.isLoading).thenReturn(true);

    await tester.runAsync(
      () async => tester.pumpWidget(
        ChangeNotifierProvider<GoNowProvider>(
          create: (_) => mockProvider,
          builder: (context, _) {
            initMeasurements(context);
            return const MaterialApp(home: GoNowPage());
          },
        ),
      ),
    );
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(seconds: 1));
    }

    expect(find.byType(ShimmerWidget), findsOneWidget);
  });

  testWidgets('GoNowPage atualiza a lista ao usar refresh', (tester) async {
    when(mockProvider.isLoading).thenReturn(false);

    await tester.runAsync(
      () async => tester.pumpWidget(
        ChangeNotifierProvider<GoNowProvider>(
          create: (_) => mockProvider,
          builder: (context, _) {
            initMeasurements(context);
            return const MaterialApp(home: GoNowPage());
          },
        ),
      ),
    );
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(seconds: 1));
    }
    await tester.fling(find.byType(RefreshIndicator), const Offset(0, 300), 1000);
    await tester.pump();
    await tester.pumpAndSettle();

    verify(mockProvider.getMotelList()).called(1);
  });
}
