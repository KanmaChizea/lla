import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: AppSpacing.appPadding,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade400,
              ),
              child: SvgPicture.asset(
                'assets/images/${ref.watch(userProvider).value!.image}.svg',
                width: 50,
              ),
            ),
            AppSpacing.space24,
            Text(
              ref.watch(userProvider).value!.name,
              style: AppTextstyles.h1Medium,
            ),
            AppSpacing.space24,
            AppSpacing.space24,
            AppSpacing.space24,
            ElevatedButton(
              onPressed: () {},
              child: const Text('Edit profile'),
            ),
            AppSpacing.space24,
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Logout'),
                          content: const Text(
                              'Logging out means you will lose all user data. Do you want to continue?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('NO')),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/welcome', (route) => false);
                                },
                                child: const Text('LOGOUT')),
                          ],
                        ));
              },
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  backgroundColor:
                      const MaterialStatePropertyAll(Color(0xFFAD1005))),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
