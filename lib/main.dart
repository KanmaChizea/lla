import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/screens/class.dart';
import 'package:lla/screens/home_screen.dart';
import 'package:lla/screens/loading.dart';
import 'package:lla/screens/profile_screen.dart';
import 'package:lla/screens/quiz_screen.dart';
import 'package:lla/screens/translator_screen.dart';
import 'package:camera/camera.dart';
import 'package:lla/screens/welcome.dart';
import 'package:lla/styles/theme.dart';

List<CameraDescription> allCameras = [];
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    allCameras = await availableCameras();
  } on CameraException catch (errorMessage) {
    log(errorMessage.description.toString());
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Language learning app',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(themeProvider) ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
        '/translate': (context) => const TranslatorScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/class': (context) => const ClassroomScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
