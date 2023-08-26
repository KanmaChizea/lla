import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class TextInputTranslator extends ConsumerStatefulWidget {
  const TextInputTranslator({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TextInputTranslatorState();
}

class _TextInputTranslatorState extends ConsumerState<TextInputTranslator> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.appPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpacing.space24,
          const Text(
            'English',
            style: AppTextstyles.caption,
          ),
          AppSpacing.space8,
          TextField(
            controller: controller,
            onChanged: (value) {
              if (ref.read(languageProvider) != null) {
                if (value.isEmpty) {
                  ref.read(textTranslatorProvider.notifier).clear();
                } else {
                  ref
                      .read(textTranslatorProvider.notifier)
                      .translate(value, ref.read(languageProvider)!);
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        const Text('Please select language first and retry'),
                    backgroundColor: Colors.red.shade700,
                  ),
                );
              }
            },
            decoration:
                const InputDecoration(hintText: 'Type in some text here'),
          ),
          AppSpacing.space24,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: ref.watch(languageProvider),
                    hint: const Text(
                      'Select language',
                      style: AppTextstyles.bodyRegular,
                    ),
                    icon: const Icon(Icons.keyboard_arrow_down),
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
                      ref
                          .read(languageProvider.notifier)
                          .update((state) => newValue ?? '');
                    }),
              ),
              IconButton(
                  onPressed: () {
                    if (ref.read(languageProvider) != null) {
                      ref.read(textTranslatorProvider.notifier).translate(
                          controller.text, ref.read(languageProvider)!);
                    }
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          AppSpacing.space8,
          ref.watch(textTranslatorProvider).isNotEmpty
              ? Text(
                  ref.watch(textTranslatorProvider),
                  style: AppTextstyles.bodyRegular,
                )
              : Text(
                  'Translated text goes here',
                  style: AppTextstyles.bodyRegular.copyWith(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
        ],
      ),
    );
  }
}
