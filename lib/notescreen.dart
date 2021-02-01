import 'package:flutter/material.dart';
import 'mainscreen.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen>
    with SingleTickerProviderStateMixin {
  double screenHeight, screenWidth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            body: Container(
                color: Colors.tealAccent[200],
                child: DefaultTabController(
                  length: 4,
                  child: Column(children: <Widget>[
                    Container(
                      constraints: BoxConstraints.expand(height: 50),
                      child: TabBar(
                        labelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: "Inheritance",
                          ),
                          Tab(text: "Polymorphism"),
                          Tab(text: "Abstraction"),
                          Tab(text: "Encapsulation"),
                        ],
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(color: Colors.black, width: 4),
                          insets: EdgeInsets.symmetric(horizontal: 20),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: TabBarView(
                        children: [
                          Container(
                              child: SingleChildScrollView(
                                  child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                height: screenHeight / 4.3,
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                  image: new AssetImage(
                                      "assets/images/inheritance.jfif"),
                                  fit: BoxFit.contain,
                                )),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(
                                    "Inheritance is a mechanism in which one class acquire the property of another class."),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(
                                    "Hence, inheritance facilitates Reusability and is an important concepts of OOP."),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(
                                    "Super Class is the class from where a subclass inherits the features. It is also known as parent or base class."),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(
                                    "Sub Class is the class that inherits the other class. It is also known as child or derived class."),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text("Type of Inheritance includes"),
                              ),
                              Container(
                                height: screenHeight / 2.3,
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                  image:
                                      new AssetImage("assets/images/inhe1.jpg"),
                                  fit: BoxFit.contain,
                                )),
                              )
                            ],
                          ))),
                          Container(
                              child: SingleChildScrollView(
                                  child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                height: screenHeight / 4.3,
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                  image: new AssetImage(
                                      "assets/images/polymorphism.jfif"),
                                  fit: BoxFit.contain,
                                )),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(
                                    "Polymorphism in Java is a concept by which we can perform a single action in different ways."),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(
                                    "2 types of polymorphism i which Compile time polymorphism (static binding) and Runtime polymorphism (dynamic binding)."),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(
                                    "Method overloading is an example of static polymomrphism."),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(
                                    "Method overriding is an example of dynamic polymorphism."),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text("Type of Inheritance includes"),
                              ),
                              Container(
                                height: screenHeight / 3,
                                width: screenWidth / 1.3,
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                  image: new AssetImage(
                                      "assets/images/poly1.jfif"),
                                  fit: BoxFit.contain,
                                )),
                              ),
                              Container(
                                height: screenHeight / 3,
                                width: screenWidth / 1.3,
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                  image:
                                      new AssetImage("assets/images/poly2.png"),
                                  fit: BoxFit.contain,
                                )),
                              )
                            ],
                          ))),
                          Container(
                            child: SingleChildScrollView(
                              child: Column(children: [
                                SizedBox(height: 10),
                                Container(
                                  height: screenHeight / 4.3,
                                  decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                    image: new AssetImage(
                                        "assets/images/abstraction.gif"),
                                    fit: BoxFit.contain,
                                  )),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text(
                                      "Abstract class is a class that can't be instantiated (objects cannot be created) and may contain abstract methods."),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text(
                                      "Abstract methods can be defined only in abstract classes and have no body."),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text(
                                      "An abstract method in parent class must be overwritten in the child class."),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text(
                                      "It needs to be extended and its method implemented in subclass."),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text("Example of Abstraction"),
                                ),
                                Container(
                                  height: screenHeight / 3,
                                  width: screenWidth / 1.3,
                                  decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                    image: new AssetImage(
                                        "assets/images/abs2.png"),
                                    fit: BoxFit.contain,
                                  )),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text("Interface vs Abstract Class"),
                                ),
                                Container(
                                  height: screenHeight / 3,
                                  width: screenWidth / 1.3,
                                  decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                    image: new AssetImage(
                                        "assets/images/abs3.png"),
                                    fit: BoxFit.contain,
                                  )),
                                ),],
                          ))),
                                Container(
                                    child: SingleChildScrollView(
                                        child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Container(
                                      height: screenHeight / 4.3,
                                      decoration: new BoxDecoration(
                                          image: new DecorationImage(
                                        image: new AssetImage(
                                            "assets/images/encapsulation.jfif"),
                                        fit: BoxFit.contain,
                                      )),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Text(
                                          "Encapsulation is a protective shield or cover that prevents the data of class from being accessed by the code outside this shield(class)."),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Text(
                                          "In encapsulation, the variables or data of a class is hidden from any other class and it can be accessed only through function of that class in which they are declared."),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Text(
                                          "It is also known as data-hiding because class data is hidden from other classes."),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Text(
                                          "We can create a fully encapsulated cass by making all the data members of the class rivate and creating public methods in the class to set and get the values of variables."),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Text("See the diagram below"),
                                    ),
                                    Container(
                                      height: screenHeight / 3,
                                      width: screenWidth / 1.3,
                                      decoration: new BoxDecoration(
                                          image: new DecorationImage(
                                        image: new AssetImage(
                                            "assets/images/en1.png"),
                                        fit: BoxFit.contain,
                                      )),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child:
                                          Text("Example of Encapsulation"),
                                    ),
                                    Container(
                                      height: screenHeight / 3,
                                      width: screenWidth / 1.3,
                                      decoration: new BoxDecoration(
                                          image: new DecorationImage(
                                        image: new AssetImage(
                                            "assets/images/en2.jfif"),
                                        fit: BoxFit.contain,
                                      )),
                                    ),
                                  ],
                                ))),
                              ]),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(10),
                              child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  minWidth: 400,
                                  height: 50,
                                  child: Text('Home',
                                      style: TextStyle(fontSize: 20)),
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
                      ),
                    )),
                  ),
     ) ;
  }
}
