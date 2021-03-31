import 'package:aroop/resultscreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'question.dart';
import 'user.dart';
import 'history.dart';
import 'package:carousel_slider/carousel_slider.dart';

class QuizScreen extends StatefulWidget {
  final User user;
  final String level;

  const QuizScreen({Key key, this.user, this.level}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  double screenHeight, screenWidth;
  List questionList;
  String titlecenter = "Loading question...";
  bool canceltimer = false;
  Color colortoshow = Colors.indigoAccent;
  int j = 1;
  int marks = 0;
  int _counter = 10;
  Timer _timer;
  String showtimer = "900";
  bool _isSelectedA = false;
  bool _isSelectedB = false;
  bool _isSelectedC = false;
  var index=0;
  var random_array;
  GlobalKey<RefreshIndicatorState> refreshKey;

  @override
  void initState() {
    super.initState();
    _loadQuestion(widget.level);
    _startTimer();
  }

  void _startTimer() {
    _counter = 900;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void checkanswer(k) {
    var msg = "";
    if (_isSelectedA &&
            questionList[index]['a'] == questionList[index]['correctans'] ||
        _isSelectedB &&
            questionList[index]['b'] == questionList[index]['correctans'] ||
        _isSelectedC &&
            questionList[index]['c'] == questionList[index]['correctans']) {
      msg = "Correct";
    } else {
      msg = "Incorrect";
    }
    setState(() {
      canceltimer = true;
    });
  }

  

  void nextquestion() {
    print("hahaha");
    canceltimer = false;
    
    setState(() {
      var lastIndex = questionList.length - 1;
      if (questionList[index] <= lastIndex) {
       // questionList[index] = random_array[index];
        questionList[index]++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultScreen(marks: marks),
        ));
      }
      
    });
    _startTimer();
  }

  
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Color(0xFFFFF3E0),
        child: Column(
          children: <Widget>[
            //Divider(color: Colors.grey),
            Container(
                alignment: Alignment.topCenter,
                child: Center(
                    child: Column(children: <Widget>[
                  (_counter > 0)
                      ? Text("")
                      : Text(
                          "DONE!",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 48,
                          ),
                        ),
                  Text(
                    '$_counter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    ),
                  ),
                ]))),
            Divider(color: Colors.grey),
            questionList == null
                ? Flexible(
                    child: Container(
                        child: Center(
                            child: Text(
                    titlecenter,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ))))
                : Flexible(
                    child: RefreshIndicator(
                        key: refreshKey,
                        color: Colors.red,
                        onRefresh: () async {
                          _loadQuestion(widget.level);
                        },
                        child: Column(
                          children: [
                            Text(questionList[0]['question'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            GestureDetector(
                                child: Column(children: [
                                  Text(questionList[0]['a']),
                                  Text(questionList[0]['b']),
                                  Text(questionList[0]['c']),
                                ]),
                                onTap: () {
                                  
                                    nextquestion();
                                  
                                }),
                            RaisedButton(
                              color: const Color(0xFF167F67),
                              child: Text(
                                "Next",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () => nextquestion(),
                            ),
                          ],
                        )))
          ],
        ),
      ),
    ));
  }

  Future<void> _loadQuestion(String level) async {
    ProgressDialog pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    pr.style(message: "Loading...");
    await pr.show();
    http.post("https://yhkywy.com/aroop/php/loadquestion.php", body: {
      "level": level,
    }).then((res) {
      print(res.body);
      if (res.body == "nodata") {
        questionList = null;
        setState(() {
          titlecenter = "No Question Found";
        });
      } else {
        setState(() {
          var jsondata = json.decode(res.body);
          questionList = jsondata["questions"];
        });
      }
    }).catchError((err) {
      print(err);
    });
    await pr.hide();
  }

  _load(int index) {
    Question question = new Question(
      questionid: questionList[index]['questionid'],
      question: questionList[index]['question'],
      correctans: questionList[index]['correctans'],
      a: questionList[index]['a'],
      b: questionList[index]['b'],
      c: questionList[index]['c'],
    );

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => HistoryScreen(
                  question: question,
                  user: widget.user,
                )));
  }
}
