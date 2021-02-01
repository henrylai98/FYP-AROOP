import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'question.dart';
import 'user.dart';
import 'history.dart';

class QuizScreen extends StatefulWidget {
  
  final User user;
  final String level;

  const QuizScreen({Key key, this.user, this.level})
      : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  double screenHeight, screenWidth;
  List questionList;
  String titlecenter = "Loading question...";
  String level = "easy";
  bool canceltimer = false;
  Color colortoshow = Colors.indigoAccent;

  int marks = 0;
 int _counter = 10;
  Timer _timer;
  String showtimer = "900";
  bool _isSelectedA = false;
  bool _isSelectedB = false;
  bool _isSelectedC = false;
  int index;

  GlobalKey<RefreshIndicatorState> refreshKey;

  @override
  void initState() {
    super.initState();
    _loadQuestion(level);
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
  

  void onVerifyClick() {
    if (_isSelectedA &&
            questionList[index]['a'] == questionList[index]['correctans'] ||
        _isSelectedB &&
            questionList[index]['b'] == questionList[index]['correctans'] ||
        _isSelectedC &&
            questionList[index]['c'] == questionList[index]['correctans']) {
      marks = marks + 10;
    } else {}
    setState(() {
      canceltimer = true;
    });
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
                child: Center(child:Column(children: <Widget>[
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
            ),]))),
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
                          level = "easy";
                          _loadQuestion(level);
                        },
                        child: GridView.count(
                          crossAxisCount: 1,
                          childAspectRatio: 1.5,
                          children: List.generate(questionList.length, (index) {
                            return Padding(
                                padding: EdgeInsets.all(1),
                                child: Card(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Text(questionList[index]['question'],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        CheckboxListTile(
                                          title: Text(questionList[index]['a']),
                                          value: _isSelectedA,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _isSelectedA = newValue;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title:  Text(questionList[index]['b']),
                                          value: _isSelectedB,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _isSelectedB = newValue;
                                            });
                                          },
                                        ),
                                        CheckboxListTile(
                                          title:  Text(questionList[index]['c']),
                                          value: _isSelectedC,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _isSelectedC = newValue;
                                            });
                                          },
                                        ),
                                        RaisedButton(
                                          color: const Color(0xFF167F67),
                                          child: Text(
                                            "Verify",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () => onVerifyClick(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          }),
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
