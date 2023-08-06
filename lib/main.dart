import 'package:flutter/material.dart';
import 'package:lla/screens/home_screen.dart';
import 'package:lla/screens/quiz_screen.dart';
import 'package:lla/screens/translator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language learning app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/translator': (context) => const TranslatorScreen(),
        '/quiz': (context) => const QuizScreen(),
      },
    );
  }
}

