import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/models/quiz_state.dart';
import 'package:lla/models/user.dart';
import 'package:lla/providers/notifiers/class_notifier.dart';
import 'package:lla/providers/notifiers/image_translator_notifier.dart';
import 'package:lla/providers/notifiers/quiz_notifier.dart';
import 'package:lla/providers/notifiers/theme_notifer.dart';
import 'package:lla/providers/notifiers/text_translator_notifier.dart';
import 'package:lla/providers/notifiers/user_notifier.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier()..init();
});

final userProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<User?>>((ref) {
  return UserNotifier();
});

final textTranslatorProvider =
    StateNotifierProvider<TextTranslatorNotifier, String>((ref) {
  return TextTranslatorNotifier();
});

final imageTranslatorProvider = StateNotifierProvider<ImageTranslatorNotifier,
    AsyncValue<ImageTranslation>>((ref) {
  return ImageTranslatorNotifier();
});

final languageProvider = StateProvider<String?>((ref) {
  return null;
});

final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  return QuizNotifier();
});

final classProvider =
    StateNotifierProvider<ClassNotifier, ClassNoteState>((ref) {
  return ClassNotifier();
});
