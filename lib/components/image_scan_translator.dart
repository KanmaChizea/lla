import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/colors.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';

class ImageScanTranslator extends ConsumerStatefulWidget {
  const ImageScanTranslator({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImageScanTranslatorState();
}

class _ImageScanTranslatorState extends ConsumerState<ImageScanTranslator> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return ImageDetectedWidget(
        image: image!,
        resetFunction: () => setState(() => image = null),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          label: const Text(
            'Take from camera',
            style: TextStyle(color: AppColors.white),
          ),
          style: ButtonStyle(
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 10, horizontal: 24)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              backgroundColor: MaterialStateProperty.all(ref.read(themeProvider)
                  ? AppColors.purple
                  : AppColors.darkPurple)),
          onPressed: () async {
            final picker = ImagePicker();
            final result = await picker.pickImage(source: ImageSource.camera);
            if (result != null) {
              ref.read(imageTranslatorProvider.notifier).detectText(result);
              setState(() {
                image = result;
              });
            }
          },
          icon: const Icon(
            Icons.add_a_photo,
            color: AppColors.white,
          ),
        ),
        AppSpacing.space24,
        TextButton.icon(
          label: const Text(
            'Upload from gallery',
            style: TextStyle(color: AppColors.white),
          ),
          style: ButtonStyle(
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(ref.read(themeProvider)
                  ? AppColors.purple
                  : AppColors.darkPurple)),
          onPressed: () async {
            final picker = ImagePicker();
            final result = await picker.pickImage(source: ImageSource.gallery);
            if (result != null) {
              ref.read(imageTranslatorProvider.notifier).detectText(result);
              setState(() {
                image = result;
              });
            }
          },
          icon: const Icon(
            Icons.upload_file,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class ImageDetectedWidget extends ConsumerStatefulWidget {
  const ImageDetectedWidget(
      {required this.image, required this.resetFunction, super.key});

  final XFile image;
  final Function() resetFunction;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImageDetectedWidgetState();
}

class _ImageDetectedWidgetState extends ConsumerState<ImageDetectedWidget> {
  late XFile image;
  late TextEditingController controller;
  bool isTranslating = false;

  @override
  void initState() {
    image = widget.image;
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(imageTranslatorProvider, (previous, next) {
      if (next is AsyncData && next.value!.translation == null) {
        setState(() {
          controller.text = next.value!.detectedText;
        });
      } else if (next is AsyncData && next.value!.translation != null) {
        setState(() {
          isTranslating = false;
        });
      }
    });
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: AppSpacing.appPadding.copyWith(top: 0),
        child: Column(
          children: [
            AppSpacing.space24,
            Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.file(
                    File(image.path),
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),
                GestureDetector(
                    onTap: widget.resetFunction, child: const Icon(Icons.close))
              ],
            ),
            AppSpacing.space24,
            ref.watch(imageTranslatorProvider).when(
                data: (data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Detected Text',
                        style: AppTextstyles.caption,
                      ),
                      AppSpacing.space8,
                      Text(
                        'Tap to edit the text if it is not accurate',
                        style: AppTextstyles.caption.copyWith(
                            fontSize: 10,
                            color: Colors.grey,
                            fontStyle: FontStyle.italic),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 300.0,
                        ),
                        child: TextField(
                          controller: controller,
                          maxLines: null,
                          style: AppTextstyles.bodyBold,
                          decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(),
                              enabledBorder: InputBorder.none),
                        ),
                      ),
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
                                items: ['Hausa', 'Igbo', 'Yoruba']
                                    .map((String items) {
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
                          TextButton(
                              onPressed: () {
                                if (ref.read(languageProvider) != null) {
                                  setState(() {
                                    isTranslating = true;
                                  });
                                  ref
                                      .read(imageTranslatorProvider.notifier)
                                      .translate(controller.text,
                                          ref.read(languageProvider)!);
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content:
                                        Text('Please select a language first'),
                                    backgroundColor: Colors.red,
                                  ));
                                }
                              },
                              child: const Text('Translate'))
                        ],
                      ),
                      isTranslating
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ref
                                      .watch(imageTranslatorProvider)
                                      .value!
                                      .translation !=
                                  null
                              ? Text(
                                  ref
                                      .watch(imageTranslatorProvider)
                                      .value!
                                      .translation!,
                                  style: AppTextstyles.bodyBold,
                                )
                              : Container()
                    ],
                  );
                },
                error: (e, s) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Could not detect text in image',
                          style: AppTextstyles.caption,
                        ),
                        AppSpacing.space24,
                        ElevatedButton(
                            onPressed: widget.resetFunction,
                            child: const Text('Clear image'))
                      ],
                    ),
                loading: () => const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        AppSpacing.space8,
                        Text(
                          'Processing image...',
                          style: AppTextstyles.caption,
                        ),
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}
