import 'package:flutter/material.dart';
import 'mainscreen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
            body: Container(
              color: Colors.tealAccent[200],
              child:Column(
          children: <Widget>[
            SizedBox(height:200),
            Container(
               alignment: Alignment.center,
               height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        ))),
                        
            Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: <Widget>[
                    Opacity(opacity: 0.5),
                    
                    SizedBox(height: 150),
                    new ProgressIndicator(),
                  ],
                )),
          ],
        ))));
  }
  
}

class ProgressIndicator extends StatefulWidget {
  @override
  _ProgressIndicatorState createState() => new _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          if (animation.value > 0.99) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => MainScreen()));
          }
        });
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
      //width: 200,
      //color: Colors.redAccent,
      child: CircularProgressIndicator(
        value: animation.value,
        //backgroundColor: Colors.black,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    ));
  }
}

