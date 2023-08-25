import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false);

  init() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final isDarkMode = sharedPreferences.getBool('isDarkMode');
      state = isDarkMode ?? true;
    } catch (e) {
      state = true;
    }
  }

  toggleTheme() async {
    state = !state;
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('isDarkMode', state);
  }
}
