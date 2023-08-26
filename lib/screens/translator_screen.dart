import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/components/image_scan_translator.dart';
import 'package:lla/components/text_input_translate.dart';
import 'package:lla/providers/providers.dart';
import 'package:lla/styles/colors.dart';

class TranslatorScreen extends ConsumerWidget {
  const TranslatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              indicatorColor: ref.watch(themeProvider)
                  ? AppColors.purple
                  : AppColors.darkPurple,
              indicatorWeight: 3,
              labelColor:
                  ref.watch(themeProvider) ? AppColors.white : AppColors.black,
              tabs: const [
                Tab(text: 'TEXT INPUT'),
                Tab(text: 'IMAGE SCAN'),
              ]),
        ),
        body: const TabBarView(
          children: [
            TextInputTranslator(),
            ImageScanTranslator(),
          ],
        ),
      ),
    );
  }
}
