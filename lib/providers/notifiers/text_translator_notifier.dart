import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator/translator.dart';

class TextTranslatorNotifier extends StateNotifier<String> {
  TextTranslatorNotifier() : super('');

  final translator = GoogleTranslator();

  translate(String text, String destinationLanguage) async {
    final result = await translator.translate(text,
        from: 'en', to: getLanguageCode(destinationLanguage));
    state = result.text;
  }

  clear() {
    state = '';
  }
}

getLanguageCode(String language) {
  switch (language) {
    case 'Igbo':
      return 'ig';
    case 'Hausa':
      return 'ha';
    case 'Yoruba':
      return 'yo';
  }
}
