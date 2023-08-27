import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class ClassroomScreen extends ConsumerWidget {
  const ClassroomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classroom'),
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.appPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/images/classroom.svg',
              ),
            ),
            AppSpacing.space24,
            AppSpacing.space14,
            const Text(
              'Select the language',
              style: AppTextstyles.caption,
            ),
            AppSpacing.space24,
            ListTile(
              title: const Text('Igbo'),
              onTap: () {
                ref.read(languageProvider.notifier).update((state) => 'Igbo');
                ref.read(classProvider.notifier).getNotes('Igbo');
                Navigator.of(context).pushNamed('/class_intro');
              },
            ),
            ListTile(
              title: const Text('Hausa'),
              onTap: () {
                ref.read(languageProvider.notifier).update((state) => 'Hausa');

                ref.read(classProvider.notifier).getNotes('Hausa');
                Navigator.of(context).pushNamed('/class_intro');
              },
            ),
            ListTile(
              title: const Text('Yoruba'),
              onTap: () {
                ref.read(languageProvider.notifier).update((state) => 'Yoruba');
                ref.read(classProvider.notifier).getNotes('Yoruba');
                Navigator.of(context).pushNamed('/class_intro');
              },
            ),
          ],
        ),
      ),
    );
  }
}
