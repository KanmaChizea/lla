import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserNotifier extends StateNotifier<AsyncValue<User?>> {
  UserNotifier() : super(const AsyncLoading());

  init() async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      final user = sharedPref.getString('user');
      if (user != null) {
        state = AsyncData(User.fromJson(user));
      } else {
        state = const AsyncData(null);
      }
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }

  set(User user) async {
    state = const AsyncLoading();
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString('user', user.toJson());
    state = AsyncData(user);
  }

  delete() async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.remove('user');
    state = const AsyncData(null);
  }
}
