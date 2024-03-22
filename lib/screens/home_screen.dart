import 'package:flutter/material.dart';
import 'package:quizmaba/models/question_model.dart';
import '../constants.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> _questions = [
    Question(id: '10', title: 'what is 2+2', options: {'5': false, '4': true, '10': false, '7': false}),
    Question(id: '10', title: 'what is 4+1', options: {'5': true, '4': false, '10': false, '7': false}),
  ];

  int index = 0;
  bool isPressed = false;

  void nextQuestion() {
    if(index == _questions.length -1){
      return;
    } else {
      setState(() {
        index++;
        isPressed = false;
      });
    }
  }

  void changeColor(){
    setState(() {
      isPressed = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('QuizMaba'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(question: _questions[index].title, indexAction: index, totalQuestions: _questions.length,),
            const Divider(color: neutral),
            const SizedBox(height: 25.0),
            for(int i=0; i<_questions[index].options.length; i++)
              OptionCard(option: _questions[index].options.keys.toList()[i],
              color : isPressed ? _questions[index].options.values.toList()[i] == true
                  ? correct
                  : incorrect
                : neutral,
                onTap: changeColor,
              )
          ],
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
