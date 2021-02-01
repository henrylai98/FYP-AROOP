import 'package:flutter/material.dart';
import 'user.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'quizscreen.dart';
import 'question.dart';
import 'mainscreen.dart';

class QuizInstructionScreen extends StatefulWidget {
  final User user;

  const QuizInstructionScreen({
    Key key,
    this.user,
  }) : super(key: key);
  @override
  _QuizInstructionScreenState createState() => _QuizInstructionScreenState();
}

class _QuizInstructionScreenState extends State<QuizInstructionScreen> {
  var levelList = {"easy", "moderate", "hard"};
  String selectedLevel = "easy";
  String titlecenter = "Loading question...";
  List questionList;
  int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            color: Colors.tealAccent[200],
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                        color: Colors.white,
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                "This quiz contains 10 MCQ questions. You are given 15 minutes to answer the quiz. If the time taken is exceeded, extra time will be given, however,marks, marks will be deducted one per3 minutes. After you have answered all the questions, you can tap on 'grade' to grade the quiz. The awards will be displayed in the result page. If you are clear with the instruction, choose the level of difficulty  tap on 'Start',time will started to count down. Good Luck!",
                                style: TextStyle(fontSize: 20))))),
                SizedBox(height: 30),
                Container(
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(
                              5.0) //                 <--- border radius here
                          ),
                    ),
                    child: DropdownButton(
                      //sorting dropdownoption
                      hint: Text(
                        'Select Location',
                        style: TextStyle(fontSize: 20),
                      ), // Not necessary for Option 1
                      value: selectedLevel,
                      onChanged: (newValue) {
                        setState(() {
                          selectedLevel = newValue;
                          print(selectedLevel);
                        });
                      },
                      items: levelList.map((selectedLevel) {
                        return DropdownMenuItem(
                          child: new Text(selectedLevel.toString(),
                              style: TextStyle(color: Colors.black)),
                          value: selectedLevel,
                        );
                      }).toList(),
                    )),
                SizedBox(height: 30),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  minWidth: 200,
                  height: 50,
                  child: Text('Start', style: TextStyle(fontSize: 20)),
                  color: Colors.black,
                  textColor: Colors.orange[300],
                  elevation: 15,
                  onPressed: _onStart,
                ),
                SizedBox(height:100),
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
                })
              ],
            )),
      ),
    );
  }

  _onStart() {
    String level = selectedLevel;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                QuizScreen(level: level, user: widget.user)));
  }
}
