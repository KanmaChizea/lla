import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lla/components/task_card.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/colors.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LLA',
          style: AppTextstyles.h2Bold.copyWith(
            color: ref.watch(themeProvider)
                ? AppColors.white
                : AppColors.darkPurple,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
            icon: Icon(
                ref.watch(themeProvider) ? Icons.light_mode : Icons.dark_mode),
            color: ref.watch(themeProvider) ? AppColors.white : AppColors.black,
          ),
          AppSpacing.space8,
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/profile'),
            child: Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
              ),
              child: SvgPicture.asset(
                'assets/images/${ref.watch(userProvider).value!.image}.svg',
                width: 24,
              ),
            ),
          ),
          AppSpacing.space8
        ],
      ),
      body: Padding(
        padding: AppSpacing.appPadding.copyWith(top: 0),
        child: LiquidPullToRefresh(
          onRefresh: () async {},
          backgroundColor: AppColors.white,
          height: 100,
          springAnimationDurationInMilliseconds: 500,
          color: AppColors.purple,
          showChildOpacityTransition: false,
          child: ListView(
            children: [
              AppSpacing.space24,
              Text(
                'Current Progress',
                style: AppTextstyles.caption.copyWith(
                    color: ref.watch(themeProvider)
                        ? Colors.grey.shade600
                        : Colors.grey.shade800),
              ),
              AppSpacing.space14,
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                child: LinearProgressIndicator(
                  minHeight: 30,
                  value: 0.3,
                  color: ref.watch(themeProvider)
                      ? AppColors.purple
                      : AppColors.darkPurple,
                  backgroundColor: ref.watch(themeProvider)
                      ? AppColors.lightPurple
                      : AppColors.lightPurple,
                ),
              ),
              AppSpacing.space24,
              AppSpacing.space24,
              Text(
                'Tasks',
                style: AppTextstyles.caption.copyWith(
                    color: ref.watch(themeProvider)
                        ? Colors.grey.shade600
                        : Colors.grey.shade800),
              ),
              AppSpacing.space14,
              GridView.count(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                children: [
                  TaskCard(
                    title: 'Classroom',
                    image: 'idea',
                    color: AppColors.lightBlue,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/class');
                    },
                  ),
                  TaskCard(
                    title: 'Quiz',
                    image: 'quiz',
                    color: AppColors.lightPurple,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/quiz');
                    },
                  ),
                  TaskCard(
                      title: 'Translate',
                      image: 'translate',
                      color: AppColors.green,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/translate');
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
