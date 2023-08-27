import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class LearningScreen extends ConsumerWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentNumber = ref.watch(classProvider).currentIndex;
    final currentNote = ref.watch(classProvider).notes[currentNumber];
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppSpacing.appPadding.copyWith(top: 0),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Center(
            child: Column(
              key: ValueKey(currentNumber),
              children: [
                const Spacer(),
                SvgPicture.asset(
                  'assets/images/teacher.svg',
                  height: 150,
                ),
                AppSpacing.space24,
                Text(
                  'In ${ref.watch(languageProvider)}, a ${currentNote.object} is called',
                  style: AppTextstyles.h2Regular,
                  textAlign: TextAlign.center,
                ),
                AppSpacing.space24,
                Text(
                  currentNote.translation,
                  style: AppTextstyles.h1Bold,
                  textAlign: TextAlign.center,
                ),
                AppSpacing.space24,
                if (currentNumber == 0) const NextButton(isFull: true),
                if (currentNumber == ref.watch(classProvider).notes.length - 1)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PreviousButton(isFull: false),
                      FinishButton(),
                    ],
                  ),
                if (currentNumber > 0 &&
                    currentNumber < ref.watch(classProvider).notes.length - 1)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PreviousButton(isFull: false),
                      NextButton(isFull: false)
                    ],
                  ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextButton extends ConsumerWidget {
  const NextButton({
    required this.isFull,
    super.key,
  });

  final bool isFull;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(classProvider.notifier).goToNext();
      },
      style: isFull
          ? null
          : Theme.of(context).elevatedButtonTheme.style?.copyWith(
                minimumSize: const MaterialStatePropertyAll(
                  Size(120, 50),
                ),
              ),
      child: const Text('Next'),
    );
  }
}

class PreviousButton extends ConsumerWidget {
  const PreviousButton({
    required this.isFull,
    super.key,
  });

  final bool isFull;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(classProvider.notifier).goToPrevious();
      },
      style: isFull
          ? null
          : Theme.of(context).elevatedButtonTheme.style?.copyWith(
                minimumSize: const MaterialStatePropertyAll(
                  Size(120, 50),
                ),
              ),
      child: const Text('Previous'),
    );
  }
}

class FinishButton extends ConsumerWidget {
  const FinishButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      },
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            minimumSize: const MaterialStatePropertyAll(
              Size(120, 50),
            ),
          ),
      child: const Text('Finish'),
    );
  }
}
