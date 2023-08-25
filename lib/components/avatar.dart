import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lla/styles/colors.dart';

class Avatar extends ConsumerWidget {
  const Avatar({required this.avi, required this.selected, super.key});

  final String avi;
  final bool selected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = (MediaQuery.of(context).size.width - 80) / 4;
    return Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border:
              selected ? Border.all(color: AppColors.purple, width: 3) : null,
        ),
        child: SvgPicture.asset(
          'assets/images/$avi.svg',
        ));
  }
}
