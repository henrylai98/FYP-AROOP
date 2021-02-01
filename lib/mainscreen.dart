import 'package:flutter/material.dart';
import 'notescreen.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'user.dart';
import 'quickpractice.dart';
import 'instructionscreen.dart';
import 'registerscreen.dart';
import 'package:toast/toast.dart';
import 'history.dart';
import 'loginscreen.dart';

class MainScreen extends StatefulWidget {
  final User user;

  const MainScreen({
    Key key,
    this.user,
  }) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double screenHeight, screenWidth;
  String email;

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
                      padding: EdgeInsets.all(15),
                      child: Row(children: [
                        SizedBox(width: 30),
                        Container(
                            height: screenHeight / 4.5,
                            width: screenWidth / 2.8,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                              image: new AssetImage("assets/images/note.jfif"),
                              fit: BoxFit.fill,
                            )),
                            child: Stack(children: [
                              InkWell(
                                onTap: () {
                                  _viewNotes();
                                },
                              ),
                              Container(
                                color: Colors.black,
                                height: screenHeight / 20,
                                alignment: Alignment.bottomCenter,
                                child: Text("View Notes",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              )
                            ])),
                        SizedBox(width: 30),
                        Container(
                            height: screenHeight / 4.5,
                            width: screenWidth / 2.8,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                              image:
                                  new AssetImage("assets/images/practice.jfif"),
                              fit: BoxFit.fill,
                            )),
                            child: Stack(children: [
                              InkWell(
                                onTap: () {
                                  _quickPractice();
                                },
                              ),
                              Container(
                                color: Colors.black,
                                height: screenHeight / 20,
                                alignment: Alignment.bottomCenter,
                                child: Text("Quick Practice",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              )
                            ])),
                      ])),
                  Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(children: [
                        SizedBox(width: 30),
                        Container(
                            height: screenHeight / 4.5,
                            width: screenWidth / 2.8,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                              image: new AssetImage("assets/images/quiz.jfif"),
                              fit: BoxFit.fill,
                            )),
                            child: Stack(children: [
                              InkWell(
                                onTap: () {
                                  _doQuiz();
                                },
                              ),
                              Container(
                                color: Colors.black,
                                height: screenHeight / 20,
                                alignment: Alignment.bottomCenter,
                                child: Text("Do Quiz",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              )
                            ])),
                        SizedBox(width: 30),
                        Container(
                            height: screenHeight / 4.5,
                            width: screenWidth / 2.8,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                              image: new AssetImage("assets/images/ar.jfif"),
                              fit: BoxFit.fill,
                            )),
                            child: Stack(children: [
                              InkWell(
                                onTap: () {
                                  _learnARTutorial();
                                },
                              ),
                              Container(
                                color: Colors.black,
                                height: screenHeight / 20,
                                alignment: Alignment.bottomCenter,
                                child: Text("AR Tutorial",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              )
                            ])),
                      ])),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(children: [
                      SizedBox(width: 30),
                      Container(
                          height: screenHeight / 4.5,
                          width: screenWidth / 2.8,
                          decoration: new BoxDecoration(
                              image: new DecorationImage(
                            image: new AssetImage("assets/images/history.jfif"),
                            fit: BoxFit.fill,
                          )),
                          child: Stack(children: [
                            InkWell(
                              onTap: () {
                                _viewHistory();
                              },
                            ),
                            Container(
                              color: Colors.black,
                              height: screenHeight / 20,
                              alignment: Alignment.bottomCenter,
                              child: Text("View History",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            )
                          ])),
                    ]),
                  ),
                  Container(
                      child: ClipPath(
                          clipper: WaveClipperTwo(reverse: true),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: screenHeight / 3,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                              image:
                                  new AssetImage("assets/images/bottom.jfif"),
                              fit: BoxFit.fill,
                            )),
                          )))
                ])))));
  }

  _viewNotes() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => NoteScreen()));
  }

  _quickPractice() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => QuickPracticeScreen()));
  }

  _doQuiz() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => QuizInstructionScreen(user:widget.user)));
  }

  _viewHistory() {
   
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Please choose your option"),
            actions: <Widget>[
              new FlatButton(
                textColor: Colors.purple[500],
                child: new Text("Register new account"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => RegisterScreen()));
                },
              ),
              new FlatButton(
                textColor: Colors.purple[500],
                child: new Text("Login to my account"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen()));
                },
              ),
            ],
          );
        },
      );
       if (widget.user.email != null) {
      print(widget.user.email);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => HistoryScreen(user:widget.user)));
    }
    
  }

  void _learnARTutorial() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => RegisterScreen()));
  }
}
