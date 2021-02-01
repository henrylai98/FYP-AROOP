import 'package:flutter/material.dart';
import 'user.dart';
import 'question.dart';
 

 
class HistoryScreen extends StatefulWidget {
  final Question question;
  final User user;
  final String level;

  const HistoryScreen({Key key, this.question, this.user, this.level}) : super(key: key);
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}