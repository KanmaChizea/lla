// ignore_for_file: file_names

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:augmented_reality_plugin/augmented_reality_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/components/LLA_app_bar.dart';

import '../models/questionsArModel_models.dart';
import '../utilities/utilities.dart';

class ARDisplayScreen extends StatefulWidget {
  const ARDisplayScreen({
    required this.answer,
    required this.index,
    required this.isCorrect,
    super.key,
  });

  final bool isCorrect;
  final String answer;
  final int index;

  @override
  State<ARDisplayScreen> createState() => _ARDisplayScreenState();
}

class _ARDisplayScreenState extends State<ARDisplayScreen> {
  List<QuestionsARModels> questionARModels =
      Utilities.questionsArModelContentList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LLAAppBar('A R View', true),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          widget.isCorrect
              ? 'you got the answer correctly'
              : 'you got the answer wrongly',
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ]),
    );
  }
}

class AugmentedRealityView extends StatefulWidget {
  const AugmentedRealityView({required this.arLink, Key? key})
      : super(key: key);
  final String arLink;

  @override
  _AugmentedRealityViewState createState() => _AugmentedRealityViewState();
}

class _AugmentedRealityViewState extends State<AugmentedRealityView> {
  @override
  Widget build(BuildContext context) {
    return AugmentedRealityPlugin(widget.arLink);
  }
}

class Try extends ConsumerStatefulWidget {
  const Try({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TryState();
}

class _TryState extends ConsumerState<Try> {
  @override
  Widget build(BuildContext context) {
    return ArCoreView(onArCoreViewCreated: (controller) {
      controller.addArCoreNode(
        ArCoreReferenceNode(objectUrl: ''),
      );
    });
  }
}
