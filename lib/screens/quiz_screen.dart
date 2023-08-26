import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/colors.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: AppSpacing.appPadding.copyWith(top: 0),
        child: Column(
          children: [
            const Text(
              'Select your preferred language and immerse yourself in an exciting quiz experience.\nGet ready to identify objects that will be projected into your world through Augmented Reality. This quiz will test your language skills as you identify these objects in the language you\'ve chosen.',
              style: AppTextstyles.caption,
            ),
            AppSpacing.space24,
            AppSpacing.space14,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.black
                      : AppColors.white,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: selected,
                    hint: const Text(
                      'Select language',
                      style: AppTextstyles.bodyRegular,
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 36,
                    isExpanded: true,
                    items: ['Hausa', 'Igbo', 'Yoruba'].map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: AppTextstyles.caption,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selected = newValue;
                      });
                    }),
              ),
            ),
            const Spacer(),
            Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  if (selected == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Please select a language to start'),
                      backgroundColor: Colors.red.shade700,
                    ));
                  } else {
                    ref.read(quizProvider.notifier).getQuiz(selected!);
                    Navigator.of(context)
                        .pushNamed('/start_quiz', arguments: selected);
                  }
                },
                child: const Text('Start'),
              );
            })
          ],
        ),
      ),
    );
  }
}
