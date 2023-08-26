import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/components/avatar.dart';
import 'package:lla/models/user.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/colors.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  late String image;
  late TextEditingController nameController;
  late TextEditingController ageController;

  @override
  void initState() {
    image = ref.read(userProvider).value!.image;
    nameController = TextEditingController.fromValue(
        TextEditingValue(text: ref.read(userProvider).value!.name));
    ageController = TextEditingController.fromValue(
        TextEditingValue(text: ref.read(userProvider).value!.age));
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Stack(
        children: [
          if (ref.watch(userProvider) is AsyncLoading)
            Container(
              color: AppColors.black.withOpacity(0.3),
            ),
          Padding(
            padding: AppSpacing.appPadding,
            child: CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Avatar',
                        style: AppTextstyles.caption,
                      ),
                      AppSpacing.space8,
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
                      TextField(controller: nameController),
                      AppSpacing.space24,
                      const Text(
                        'Age',
                        style: AppTextstyles.caption,
                      ),
                      AppSpacing.space8,
                      TextField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: ref.watch(userProvider) is AsyncLoading
                            ? null
                            : () {
                                final currentUser =
                                    ref.read(userProvider).value!;
                                final age =
                                    ageController.text == currentUser.age
                                        ? currentUser.age
                                        : ageController.text;
                                final name =
                                    nameController.text == currentUser.name
                                        ? currentUser.name
                                        : nameController.text;
                                final newAvi = image == currentUser.image
                                    ? currentUser.image
                                    : image;
                                ref.read(userProvider.notifier).set(
                                    User(name: name, age: age, image: newAvi));
                              },
                        child: ref.watch(userProvider) is AsyncLoading
                            ? const CircularProgressIndicator()
                            : const Text('Save'),
                      ),
                      AppSpacing.space24,
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
