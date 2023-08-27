import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lla/styles/spacing.dart';
import 'package:lla/styles/textstyles.dart';
import 'package:vector_math/vector_math_64.dart';

class ArScreen extends ConsumerStatefulWidget {
  const ArScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ArScreenState();
}

class _ArScreenState extends ConsumerState<ArScreen> {
  ArCoreController? arController;
  ArCoreNode? node;

  void onArCoreViewCreated(ArCoreController controller) {
    arController = controller;
    initializeObject();
    arController?.onPlaneTap = handleOnPlaneTap;
  }

  void initializeObject() {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    final objectX = screenWidth / 2;
    final objectY = screenHeight / 2;

    node = ArCoreReferenceNode(
      name: 'Toucano',
      objectUrl:
          "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF/Duck.gltf",
      position: Vector3(objectX, objectY, -1.0),
    );
    arController?.addArCoreNodeWithAnchor(node!);
  }

  void addObjectFromTap(ArCoreHitTestResult plane) {
    node = ArCoreReferenceNode(
      name: 'Toucano',
      objectUrl:
          "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF/Duck.gltf",
      position: plane.pose.translation,
      rotation: plane.pose.rotation,
    );
    arController?.addArCoreNodeWithAnchor(node!);
  }

  void handleOnPlaneTap(List<ArCoreHitTestResult> hits) async {
    if (node != null) {
      await arController?.removeNode(nodeName: node!.name);
    }
    final hit = hits.first;
    addObjectFromTap(hit);
  }

  @override
  void dispose() {
    arController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: AppSpacing.appPadding.copyWith(top: 0),
            child: const Text(
              'Ensure your surroundings are well-lit. Tap the screen and move your phone for the app to detect a plane. The plane will be represented by a cluster of bubbles. Tap the plane, wait a bit, and see your AR object come to life!',
              style: AppTextstyles.caption,
            ),
          ),
          Expanded(
            child: ArCoreView(
              onArCoreViewCreated: onArCoreViewCreated,
              enableTapRecognizer: true,
            ),
          ),
        ],
      ),
    );
  }
}
