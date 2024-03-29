import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_developer_27_maret_2024/provider/data_list_provider.dart';
import 'package:mobile_developer_27_maret_2024/provider/video_provider.dart';
import 'package:mobile_developer_27_maret_2024/ui/home_page.dart';
import 'package:provider/provider.dart';

import 'data/api/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  const enabled = true;
  runApp(
    DevicePreview(
      enabled: enabled,
      builder: (_) => const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MultiProvider _buildMultiProvider({
    required Widget Function(BuildContext context) builder,
  }) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataListProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoProvider(),
        ),
      ],
      builder: (context, _) => builder(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Newtronic Academic',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _buildMultiProvider(
        builder: (context) {
          return const HomePage();
        },
      ),
    );
  }
}

///
/// Penggunaan sementara agar terhindar dari
/// pembatasan sertifikat protokol client yang buruk,
/// mungkin sebaiknya dipikirkan bagaimana mengatasi protokol client
/// yang buruk tersebut agar tidak menyebabkan masalah keamanan
///
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
