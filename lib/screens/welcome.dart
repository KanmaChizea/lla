import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/components/avatar.dart';
import 'package:lla/models/user.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  final formKey = GlobalKey<FormState>();
  String image = '';

  @override
  void initState() {
    nameController = TextEditingController();
    ageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userProvider,
      (previous, next) {
        if (next is AsyncData && next.value != null) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
        }
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.appPadding,
          child: Form(
            key: formKey,
            child: CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('App logo'),
                      AppSpacing.space8,
                      const Text(
                        'Welcome to LLA',
                        style: AppTextstyles.h1Bold,
                      ),
                      AppSpacing.space14,
                      AppSpacing.space24,
                      AppSpacing.space24,
                      AppSpacing.space24,
                      const Text(
                        'Select an avatar',
                        style: AppTextstyles.caption,
                      ),
                      AppSpacing.space24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: ['avi1', 'avi2', 'avi3', 'avi4']
                            .map((e) => GestureDetector(
                                  onTap: () => setState(() {
                                    image = e;
                                  }),
                                  child: Avatar(
                                    avi: e,
                                    selected: e == image,
                                  ),
                                ))
                            .toList(),
                      ),
                      AppSpacing.space24,
                      const Text(
                        'Name',
                        style: AppTextstyles.caption,
                      ),
                      AppSpacing.space8,
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required field';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'What would you like to be called?'),
                      ),
                      AppSpacing.space24,
                      const Text(
                        'Age',
                        style: AppTextstyles.caption,
                      ),
                      AppSpacing.space8,
                      TextFormField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required field';
                          }
                          if (((int.tryParse(value) ?? -1) < 0 ||
                              (int.tryParse(value) ?? 101) > 100)) {
                            return 'Please enter a valid age';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(hintText: 'How old are you?'),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: ref.watch(userProvider) is AsyncLoading
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  if (image.isEmpty) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Please select an avatar'),
                                      backgroundColor: Colors.red,
                                    ));
                                  } else {
                                    final user = User(
                                        name: nameController.text,
                                        age: ageController.text,
                                        image: image);
                                    ref.read(userProvider.notifier).set(user);
                                  }
                                }
                              },
                        child: ref.watch(userProvider) is AsyncLoading
                            ? const CircularProgressIndicator()
                            : const Text('Continue'),
                      ),
                      AppSpacing.space24,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
