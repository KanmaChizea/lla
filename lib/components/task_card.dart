import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lla/styles/colors.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.image,
    required this.title,
    required this.onPressed,
    required this.color,
    this.padding,
  });

  final String image;
  final String title;
  final Function() onPressed;
  final Color color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: const BoxDecoration(
          color: AppColors.glass,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 36,
              child: SvgPicture.asset(
                'assets/images/$image.svg',
                theme: const SvgTheme(currentColor: AppColors.black),
                height: 25,
                width: 25,
              ),
            ),
            AppSpacing.space24,
            Text(
              title,
              style: AppTextstyles.bodyRegular,
            ),
          ],
        ),
      ),
    );
  }
}
