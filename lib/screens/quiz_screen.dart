import 'package:flutter/material.dart';
//! components imports
import 'package:lla/components/LLA_app_bar.dart';
import '../components/LLA_bottom_navigational_bar.dart';
import '../components/Quiz_question_display.dart';
import '../components/Quiz_questions_list_view.dart';
//! models imports
import '../models/options_model.dart';
import '../models/questionsArModel_models.dart';
import '../models/questions_model.dart';
import '../utilities/constants.dart';
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

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
//! the appbar
      appBar: LLAAppBar('Q U I Z', true),
//!the body of the scaffold
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: QuizQuestionDisplay(
              size,
              questions[totalQuestions].question,
            ),
          ),
          kMediumSizedBoxSpace,
          QuizQuestionsListView(size,  totalQuestions,  options.length - 1,),
        ],
      ),
//! the bottom navigational bar
      bottomNavigationBar: LLABottomNavigationBar(context,   Theme.of(context).colorScheme.secondary, Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary,),
    );
  }

  
}
