import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/models/quiz.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/colors.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class QuizQuestion extends ConsumerStatefulWidget {
  const QuizQuestion({required this.quiz, super.key});

  final Quiz quiz;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizQuestionState();
}

class _QuizQuestionState extends ConsumerState<QuizQuestion> {
  late Quiz quiz;
  int? selectedOption;

  @override
  void initState() {
    quiz = widget.quiz;
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
            child: Text(
                'Question ${ref.watch(quizProvider).currentQuestionNo + 1}'),
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
              return GestureDetector(
                onTap: () => setState(() {
                  selectedOption = index;
                }),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: index == selectedOption
                        ? AppColors.lightPurple
                        : AppColors.glass,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '${String.fromCharCode(index + 65)}: ${quiz.options[index]}',
                    style: AppTextstyles.bodyRegular,
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: selectedOption == null
                ? null
                : () {
                    ref
                        .read(quizProvider.notifier)
                        .processAnswer(selectedOption!);
                  },
            child: Text(ref.watch(quizProvider).currentQuestionNo ==
                    ref.watch(quizProvider).questions.length - 1
                ? 'Finish'
                : 'Next'),
          ),
          AppSpacing.space24,
        ],
      ),
    );
  }
}
