import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guia_go/core/constants/colors.dart';
import 'package:guia_go/core/di/general_di.dart';
import 'package:guia_go/core/http_client/data/implementation/http_client.dart';
import 'package:guia_go/core/instance_manager/data/implementation/get_it_instance_manager.dart';
import 'package:guia_go/core/measurements/measurements.dart';
import 'package:guia_go/modules/go_now/presentation/pages/go_now_page.dart';
import 'package:guia_go/modules/go_now/presentation/providers/go_now_provider.dart';
import 'package:guia_go/modules/shared/presentation/widgets/custom_scroll_behavior.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  initInstanceManagerWithGetIt();
  initInstanceManagerWithHttp();
  initInstances();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initMeasurements(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GoNowProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryRed),
          useMaterial3: true,
        ),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: child ?? const SizedBox(),
          );
        },
        home: const GoNowPage(),
      ),
    );
  }
}
