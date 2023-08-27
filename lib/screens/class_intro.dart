import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/colors.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class ClassIntroScreen extends ConsumerWidget {
  const ClassIntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ref.watch(classProvider).notes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: AppSpacing.appPadding,
              child: Column(
                children: [
                  Text(
                    '${ref.watch(languageProvider)} Lesson',
                    style: AppTextstyles.h2Bold,
                  ),
                  AppSpacing.space32,
                  SvgPicture.asset(
                    'assets/images/question.svg',
                    height: 100,
                  ),
                  AppSpacing.space24,
                  const Text(
                    'Welcome to Objects Identification Class!',
                    style: AppTextstyles.h3Medium,
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.space8,
                  Text(
                    'Get set to discover and recognize everyday objects in this class.',
                    style:
                        AppTextstyles.caption.copyWith(color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                  AppSpacing.space32,
                  AppSpacing.space32,
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/learning');
                      },
                      child: const Text('Begin'))
                ],
              ),
            ),
    );
  }
}
