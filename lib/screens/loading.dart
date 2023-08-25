import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/models/user.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/colors.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  @override
  void initState() {
    ref.read(userProvider.notifier).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userProvider,
      (previous, next) {
        if (next is AsyncData && next.value == null) {
          Navigator.of(context).pushReplacementNamed('/welcome');
        } else if (next is AsyncData && next.value is User) {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      },
    );
    return Scaffold(
      body: Container(
        color: ref.watch(themeProvider) ? AppColors.darkBlue : AppColors.white,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
