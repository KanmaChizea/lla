import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/styles/spacing.dart';

class StartQuiz extends ConsumerStatefulWidget {
  const StartQuiz({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartQuizState();
}

class _StartQuizState extends ConsumerState<StartQuiz> {
  @override
  Widget build(BuildContext context) {
    final language = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.appPadding.copyWith(top: 0),
          child: Text(language),
        ),
      ),
    );
  }
}
