import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/screens/ar_screen.dart';
import 'package:lla/screens/class.dart';
import 'package:lla/screens/edit_profile_screen.dart';
import 'package:lla/screens/home_screen.dart';
import 'package:lla/screens/class_intro.dart';
import 'package:lla/screens/learning_screen.dart';
import 'package:lla/screens/loading.dart';
import 'package:lla/screens/profile_screen.dart';
import 'package:lla/screens/quiz_complete.dart';
import 'package:lla/screens/quiz_screen.dart';
import 'package:lla/screens/review_quiz.dart';
import 'package:lla/screens/start_quiz.dart';
import 'package:lla/screens/translator_screen.dart';
import 'package:lla/screens/welcome.dart';
import 'package:lla/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        '/start_quiz': (context) => const StartQuiz(),
        '/edit_profile': (context) => const EditProfileScreen(),
        '/quiz_complete': (context) => const QuizComplete(),
        '/review_quiz': (context) => const ReviewQuiz(),
        '/ar_screen': (context) => const ArScreen(),
        '/class_intro': (context) => const ClassIntroScreen(),
        '/learning': (context) => const LearningScreen()
      },
    );
  }
}
