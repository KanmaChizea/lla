// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lla/providers/notifiers/text_translator_notifier.dart';
import 'package:translator/translator.dart';

class ImageTranslation {
  final String detectedText;
  final String? translation;
  ImageTranslation({
    required this.detectedText,
    this.translation,
  });

  ImageTranslation copyWith({
    String? detectedText,
    String? translation,
  }) {
    return ImageTranslation(
      detectedText: detectedText ?? this.detectedText,
      translation: translation ?? this.translation,
    );
  }
}

class ImageTranslatorNotifier
    extends StateNotifier<AsyncValue<ImageTranslation>> {
  ImageTranslatorNotifier() : super(const AsyncLoading());

  final translator = GoogleTranslator();

  Future detectText(XFile image) async {
    try {
      state = const AsyncLoading();
      final GoogleVisionImage visionImage =
          GoogleVisionImage.fromFilePath(image.path);
      final TextRecognizer textRecognizer =
          GoogleVision.instance.textRecognizer();
      final visionText = await textRecognizer.processImage(visionImage);
      if (visionText.text != null) {
        state = AsyncData(ImageTranslation(detectedText: visionText.text!));
      } else {
        state = AsyncError(Error(), StackTrace.current);
      }
      textRecognizer.close();
    } catch (e, s) {
      log(e.toString());
      state = AsyncError(e, s);
    }
  }

  translate(String text, String destinationLanguage) async {
    final result = await translator.translate(text,
        from: 'en', to: getLanguageCode(destinationLanguage));
    state = AsyncData(
        ImageTranslation(detectedText: text, translation: result.text));
  }
}
