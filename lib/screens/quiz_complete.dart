import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class QuizComplete extends ConsumerStatefulWidget {
  const QuizComplete({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuizCompleteState();
}

class _QuizCompleteState extends ConsumerState<QuizComplete> {
  late String message;
  late String image;

  @override
  void initState() {
    message = '';
    image = '';
    super.initState();
  }

  @override
  void didChangeDependencies() {
    message = getMessage(ref.watch(quizProvider.notifier).totalScore /
        ref.watch(quizProvider).questions.length);
    image = getImage(ref.watch(quizProvider.notifier).totalScore /
        ref.watch(quizProvider).questions.length);
    super.didChangeDependencies();
  }

  String getImage(double score) {
    final percentage = score * 100;
    if (percentage >= 70) {
      return 'good';
    } else if (percentage >= 40) {
      return 'med';
    }
    return 'bad';
  }

  String getMessage(double score) {
    final percentage = score * 100;
    if (percentage >= 90 && percentage <= 100) {
      return "You're on fire! E go be, language champion! 🚀 Keep the vibes going strong!";
    } else if (percentage >= 70 && percentage < 90) {
      return "You sabi! You dey try well well. No dulling, the sky na your stepping stone!";
    } else if (percentage >= 50 && percentage < 70) {
      return "Nice one! E no easy. Steady practice go turn you to language pro. Keep the energy!";
    } else if (percentage >= 30 && percentage < 50) {
      return "Make you no dey discouraged abeg. E no dey end for here. Stay focused and see how you go shine.";
    } else {
      return "No wahala, my guy. No rush am. Slow and steady wins the race. Keep your eye for the prize.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.appPadding,
          child: Column(
            children: [
              const Text(
                'QUIZ COMPLETE',
                style: AppTextstyles.bodyRegular,
              ),
              AppSpacing.space24,
              SvgPicture.asset(
                'assets/images/$image.svg',
                width: image == 'bad' ? 130 : 200,
              ),
              Text(
                '${ref.watch(quizProvider.notifier).totalScore}/${ref.watch(quizProvider).questions.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 80,
                ),
              ),
              AppSpacing.space14,
              Text(
                message,
                style: AppTextstyles.caption,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/review_quiz');
                },
                child: const Text('See results'),
              ),
              AppSpacing.space32,
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/home', (route) => false);
                },
                child: const Text('Go home'),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
