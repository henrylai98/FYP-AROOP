import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'package:quiz_view/quiz_view.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuickPracticeScreen extends StatefulWidget {
  @override
  _QuickPracticeScreenState createState() => _QuickPracticeScreenState();
}

class _QuickPracticeScreenState extends State<QuickPracticeScreen>
    with TickerProviderStateMixin {
  double screenHeight, screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.tealAccent[200],
          child: SingleChildScrollView(
              child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                QuizView(
                    showCorrect: true,
                    questionTag: 'Question 1',
                    questionColor: Colors.black,
                    tagColor: Colors.yellowAccent,
                    backgroundColor: Colors.white70,
                    tagBackgroundColor: Colors.red.shade300,
                    answerColor: Colors.white,
                    answerBackgroundColor: Colors.deepPurple,
                    question:
                        'Which is among the following best describes the Inheritance?',
                    height: screenHeight / 1.3,
                    width: screenWidth / 1.2,
                    rightAnswer:
                        'Using the data and functions into derived segment',
                    wrongAnswers: [
                      'Copying the code already written',
                      'Using the code already written once',
                    ],
                    onRightAnswer: () => print('Right!'),
                    onWrongAnswer: () {
                      Alert(
                        context: context,
                        title: 'Wrong!\nIt can only be indicated by using the data and functions that we use in derived class, being provided by parent class. Copying code is nowhere similar to this concept, also using the code already written is same as copying. Using already defined functions is not inheritance as we are not adding any of our own features.',
                      ).show();
                    }),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                QuizView(
                    showCorrect: true,
                    questionTag: 'Question 2',
                    questionColor: Colors.black,
                    tagColor: Colors.yellowAccent,
                    backgroundColor: Colors.white70,
                    tagBackgroundColor: Colors.red.shade300,
                    answerColor: Colors.white,
                    answerBackgroundColor: Colors.deepPurple,
                    question:
                        'How many basics types of inheritance are provided as OOP feature?',
                    height: screenHeight / 1.3,
                    width: screenWidth / 1.2,
                    rightAnswer: '4',
                    wrongAnswers: [
                      '3',
                      '2',
                    ],
                    onRightAnswer: () => print('Right!'),
                    onWrongAnswer: () {
                      Alert(
                        context: context,
                        title: 'Wrong!\nThe types are single, multi level, hierarchical and multiple inheritance',
                        
                      ).show();
                    }),
              ],
            ),
          ),
        ),
        SizedBox(height:70),
         Padding(padding:EdgeInsets.all(10), child:
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  minWidth: 400,
                  height: 50,
                  child: Text('Home', style: TextStyle(fontSize: 20)),
                  color: Colors.black,
                  textColor: Colors.orange[300],
                  elevation: 15,onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MainScreen()));
                })),
      ]))),
    ));
  }
}
