// ignore_for_file: file_names

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:lla/components/LLA_app_bar.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../models/questionsArModel_models.dart';
import '../utilities/utilities.dart';
import 'localAndWebObjectsview.dart';

class ARDisplayScreen extends StatefulWidget {
  const ARDisplayScreen(
      { 
        required this.answer,
        required this.index,
        required this.isCorrect, super.key,});

  final bool isCorrect;
  final String answer;
  final int index;

  @override
  State<ARDisplayScreen> createState() => _ARDisplayScreenState();
}



class _ARDisplayScreenState extends State<ARDisplayScreen> {
  //if this doesnt work, add the null check
  late ArCoreController arCoreController;
   List<QuestionsARModels> questionARModels =
      Utilities.questionsArModelContentList();

@override
Widget build(BuildContext context) {

     void onLocalObjectButtonPressed(BuildContext context, String arModelUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocalAndWebObjectsView(
          arModelUrl: arModelUrl,
        ),
      ),
    );
  }


  Widget checkMove() {
    setState(() {
        String? arModelUrl = questionARModels[widget.index].arLink;
        onLocalObjectButtonPressed(context, arModelUrl);
    });

    return Container();
  }
   

Future<void> launchARView(String arModelUrl) async {
    // Check if ARCore is available on the device
    bool isARCoreAvailable = await ArCoreController.checkArCoreAvailability();
    if (!isARCoreAvailable) {
      // ARCore is not supported on this device
      return;
    }

    // Create the ARCore session
    arCoreController = ArCoreController(
      id: DateTime.now().millisecondsSinceEpoch.toInt(),
    );

    // Load the 3D model from the Cloudinary URL
    ArCoreNode arModelNode = ArCoreNode(
      name: arModelUrl,
      scale: vector.Vector3(0.1, 0.1, 0.1), // Adjust the scale as needed
    );

    // Add the 3D model node to the AR scene
    arCoreController.addArCoreNodeWithAnchor(arModelNode);

    //

    // Present the AR view
    // ignore: use_build_context_synchronously
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArCoreViewPage(arCoreController),
      ),
    );

    // Perform any cleanup after the AR view is dismissed
    arCoreController.dispose();
  }

//TODO: handle this function
  void navigateToResultPage() {
    
    // Navigator.push(
    //   context,
    //   // MaterialPageRoute(
    //   //   builder: (context) => ResultPage(
    //   //     correctAnswers: correctAnswers,
    //   //     totalQuestions: totalQuestions,
    //   //     average: correctAnswers / totalQuestions,
    //   //   ),
    //   // ),
    // );
  }

//  String? arModelUrl = questionARModels[index].arLink;
       // onLocalObjectButtonPressed(context, arModelUrl);

  return Scaffold(appBar: LLAAppBar('A R View', true), body: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
             Text(
          widget.isCorrect ? 'you got the answer correctly' : 'you got the answer wrongly',
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),

        checkMove()
    ]),);
}




 
}

class ArCoreViewPage extends StatelessWidget {
  final ArCoreController arCoreController;

  const ArCoreViewPage(this.arCoreController, {Key? key}) : super(key: key);

  get onArCoreViewCreated => arCoreController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR View'),
      ),
      body: Center(
        child: ArCoreView(
          onArCoreViewCreated: onArCoreViewCreated,
          enableTapRecognizer: true,
        ),
      ),
    );
  }
}
