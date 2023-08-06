import 'package:flutter/material.dart';
//! components imports
import 'package:lla/components/LLA_app_bar.dart';
import '../components/LLA_bottom_navigational_bar.dart';
//! models imports
import '../models/options_model.dart';
import '../models/questionsArModel_models.dart';
import '../models/questions_model.dart';
import '../utilities/utilities.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool allQuestionsAnswered = false;
  //late ArCoreController arCoreController;
  int correctAnswers = 0;
  double dailyProgress = 0.0;
  int totalQuestions = 0;



//! model classes initialization
  List<QuestionsModel> questions = Utilities.questionsContentList();
  List<OptionsModel> options = Utilities.optionsContentList();
  List<QuestionsARModels> questionARModels =
      Utilities.questionsArModelContentList();
  
  Future<bool> checkAnswer(String selectedOption, String correctAnswer) async {
    setState(() {
      if (selectedOption == correctAnswer) {
        correctAnswers++;
       // String? arModelUrl = questionARModels[totalQuestions].arLink;
        //! ??? what is going on here
        //! why does this accept null values
       // onLocalObjectButtonPressed(context, arModelUrl);
      }

      totalQuestions++;

      dailyProgress =
          totalQuestions > 0 ? correctAnswers / totalQuestions : 0.0;

      if (totalQuestions >= questions.length) {
        allQuestionsAnswered = true;
      }
    });

    return allQuestionsAnswered;
  }

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
//! the appbar
     appBar: LLAAppBar('Q U I Z'),
//!the body of the scaffold
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Container(
              width: size.width * 0.9,
              height: size.height * 0.35,
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  //keys,
                  questions[totalQuestions].question,
                  //questions[totalQuestions].toString(),
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: size.height * 0.45,
              child: ListView.builder(
                itemCount: options.length - 1,
                // itemExtent: options.length.toDouble() - 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    //TODO: make this buttons white
                    child: ElevatedButton(
                      onPressed: () async {
                        bool allQuestionsAnswered = await checkAnswer(
                            options[totalQuestions].option[index],
                            questions[totalQuestions].answer);

                        if (allQuestionsAnswered) {
                       //   navigateToResultPage();
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(4)),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 20))),
                      child: SizedBox(
                        width: size.width * 0.7,
                        height: size.height * 0.1,
                        child: Center(
                          child: Text(
                            options[totalQuestions].option[index],
                            style: const TextStyle(
                                fontSize: 18, color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          

        ],),
//! the bottom navigational bar
      bottomNavigationBar: LLABottomNavigationBar(context),
    
    );
  }
}