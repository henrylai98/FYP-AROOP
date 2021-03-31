import 'package:flutter/material.dart';
import 'mainscreen.dart';
import 'package:quiz_view/quiz_view.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    return Scaffold(
        body: Container(
            color: Colors.tealAccent[200],
            child: ListView(
              children: [
                Padding(padding:EdgeInsets.all(10),child:Text("This practice consist of 10 MCQ questions. Swipe to move back and forth between questions.",style:TextStyle(fontSize:20, fontWeight:FontWeight.bold))),
                CarouselSlider(
                  items: [
                    //1st Image of Slider
                    Container(
                      child: Container(
                        width: screenWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                onRightAnswer: () => print('Correct!'),
                                onWrongAnswer: () {
                                  Alert(
                                    context: context,
                                    title:
                                        'Wrong!\nIt can only be indicated by using the data and functions that we use in derived class, being provided by parent class. Copying code is nowhere similar to this concept, also using the code already written is same as copying. Using already defined functions is not inheritance as we are not adding any of our own features.',
                                  ).show();
                                }),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Container(
                        width: screenWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                onRightAnswer: () => print('Correct!'),
                                onWrongAnswer: () {
                                  Alert(
                                    context: context,
                                    title:
                                        'Wrong!\nThe types are single, multi level, hierarchical and multiple inheritance',
                                  ).show();
                                }),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Container(
                        width: screenWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            QuizView(
                                showCorrect: true,
                                questionTag: 'Question 3',
                                questionColor: Colors.black,
                                tagColor: Colors.yellowAccent,
                                backgroundColor: Colors.white70,
                                tagBackgroundColor: Colors.red.shade300,
                                answerColor: Colors.white,
                                answerBackgroundColor: Colors.deepPurple,
                                question:
                                    'Which among the following best describes encapsulation?',
                                height: screenHeight / 1.2,
                                width: screenWidth / 1.2,
                                rightAnswer:
                                    'It is a way of combining various data members and member functions that operate on those data members into a single units',
                                wrongAnswers: [
                                  'It is a way of combining vaious data members into a single unit.',
                                  'It is a way of combining various member functions into a single unit',
                                ],
                                onRightAnswer: () => print('Correct!'),
                                onWrongAnswer: () {
                                  Alert(
                                    context: context,
                                    title:
                                        'Wrong!\nWe call it a class in OOP generally. This feature have helped us modify the structures used in C language to be upgraded into class in C++ and other languages.',
                                  ).show();
                                }),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Container(
                        width: screenWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            QuizView(
                                showCorrect: true,
                                questionTag: 'Question 4',
                                questionColor: Colors.black,
                                tagColor: Colors.yellowAccent,
                                backgroundColor: Colors.white70,
                                tagBackgroundColor: Colors.red.shade300,
                                answerColor: Colors.white,
                                answerBackgroundColor: Colors.deepPurple,
                                question:
                                    'If data members are private, what can we do to access them from the class object?',
                                height: screenHeight / 1.17,
                                width: screenWidth / 1.2,
                                rightAnswer:
                                    'Create public member functions to access those data members',
                                wrongAnswers: [
                                  'Create private member functions to access those data members ',
                                  'Create protected member functions to access those data members',
                                ],
                                onRightAnswer: () => print('Correct!'),
                                onWrongAnswer: () {
                                  Alert(
                                    context: context,
                                    title:
                                        'Wrong!\nIt can only be indicated by using the data and functions that we use in derived class, being provided by parent class. Copying code is nowhere similar to this concept, also using the code already written is same as copying. Using already defined functions is not inheritance as we are not adding any of our own features.',
                                  ).show();
                                }),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: screenWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            QuizView(
                                showCorrect: true,
                                questionTag: 'Question 5',
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
                                onRightAnswer: () => print('Correct!'),
                                onWrongAnswer: () {
                                  Alert(
                                    context: context,
                                    title:
                                        'Wrong!\nIt can only be indicated by using the data and functions that we use in derived class, being provided by parent class. Copying code is nowhere similar to this concept, also using the code already written is same as copying. Using already defined functions is not inheritance as we are not adding any of our own features.',
                                  ).show();
                                }),
                          ],
                        ),
                      ),
                    )),
                  ],
                  options: CarouselOptions(
                    height: 700.0,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    aspectRatio: 1,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: false,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 1.0,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        minWidth: 400,
                        height: 50,
                        child: Text('Home', style: TextStyle(fontSize: 20)),
                        color: Colors.black,
                        textColor: Colors.orange[300],
                        elevation: 15,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MainScreen()));
                        })),
              ],
            )));
  }
}
