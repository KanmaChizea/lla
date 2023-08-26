import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/models/quiz.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/colors.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class ReviewQuiz extends ConsumerStatefulWidget {
  const ReviewQuiz({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReviewQuizState();
}

class _ReviewQuizState extends ConsumerState<ReviewQuiz> {
  int currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSpacing.appPadding,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: currentQuestion < ref.watch(quizProvider).questions.length
              ? ReviewQuizQuestion(
                  key: ValueKey(currentQuestion),
                  quiz: ref.watch(quizProvider).questions[currentQuestion],
                  currentQuestion: currentQuestion,
                  goBackFunction: () =>
                      setState(() => currentQuestion = currentQuestion - 1),
                  nextFunction: () =>
                      setState(() => currentQuestion = currentQuestion + 1),
                )
              : Container(),
        ),
      ),
    );
  }
}

class ReviewQuizQuestion extends ConsumerStatefulWidget {
  const ReviewQuizQuestion({
    required this.quiz,
    required this.currentQuestion,
    required this.goBackFunction,
    required this.nextFunction,
    super.key,
  });

  final Quiz quiz;
  final int currentQuestion;
  final Function() goBackFunction;
  final Function() nextFunction;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ReviewQuizQuestionState();
}

class _ReviewQuizQuestionState extends ConsumerState<ReviewQuizQuestion> {
  late Quiz quiz;
  late int currentQuestion;

  @override
  void initState() {
    quiz = widget.quiz;
    currentQuestion = widget.currentQuestion;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.space14,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: ref.watch(themeProvider)
                  ? AppColors.purple
                  : AppColors.lightPurple.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text('Question ${currentQuestion + 1}'),
          ),
          AppSpacing.space24,
          AppSpacing.space24,
          Text(
            quiz.question,
            style: AppTextstyles.h2Regular,
          ),
          AppSpacing.space24,
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/ar_screen'),
            child: Text(
              'Tap to view image in AR',
              style: AppTextstyles.caption.copyWith(
                color: Colors.purple,
              ),
            ),
          ),
          AppSpacing.space32,
          ListView.separated(
            shrinkWrap: true,
            itemCount: quiz.options.length,
            separatorBuilder: (context, index) => AppSpacing.space32,
            itemBuilder: (context, index) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: quiz.options[index] == quiz.answer
                      ? AppColors.green
                      : quiz.options[index] == quiz.selectedOption
                          ? Colors.red.shade200
                          : AppColors.glass,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '${String.fromCharCode(index + 65)}: ${quiz.options[index]}',
                  style: AppTextstyles.bodyRegular,
                ),
              );
            },
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  if (currentQuestion != 0) {
                    widget.goBackFunction();
                  }
                },
                style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                      minimumSize: const MaterialStatePropertyAll(
                        Size(120, 50),
                      ),
                    ),
                icon: const Icon(Icons.skip_previous),
                label: const Text('Previous'),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  if (currentQuestion <
                      ref.read(quizProvider).questions.length - 1) {
                    widget.nextFunction();
                  } else {
                    Navigator.pop(context);
                  }
                },
                style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                      minimumSize: const MaterialStatePropertyAll(
                        Size(120, 50),
                      ),
                    ),
                icon: Text(currentQuestion <
                        ref.read(quizProvider).questions.length - 1
                    ? 'Next'
                    : 'Finish'),
                label: const Icon(Icons.skip_next),
              )
            ],
          ),
          AppSpacing.space24,
        ],
      ),
    );
  }
}
