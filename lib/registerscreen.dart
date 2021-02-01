import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'loginscreen.dart';
import 'package:flutter/services.dart';
import 'mainscreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _signUpActive = true;
  bool _signInActive = false;
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emcontroller = TextEditingController();
  final TextEditingController _pscontroller = TextEditingController();
  final fieldText = TextEditingController();
  String _email = "";
  String _password = "";
  String _name = "";
  bool _passwordVisible = false;

  void _onReset() {
    _namecontroller.clear();
    _emcontroller.clear();
    _pscontroller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                color: Colors.tealAccent[200],
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlineButton(
                              onPressed: () => _changeToSignUp(),
                              borderSide: new BorderSide(
                                style: BorderStyle.none,
                              ),
                              child: new Text("Sign up",
                                  style: _signUpActive
                                      ? TextStyle(
                                          fontSize: 30,
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.bold)
                                      : TextStyle(
                                          fontSize: 24,
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.normal)),
                            ),
                            OutlineButton(
                              onPressed: () => _changeToSignIn(),
                              borderSide: BorderSide(
                                style: BorderStyle.none,
                              ),
                              child: Text("Sign in",
                                  style: _signInActive
                                      ? TextStyle(
                                          fontSize: 22,
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.bold)
                                      : TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.normal)),
                            ),
                          ]),
                          SizedBox(height:10),
                      Image.asset(
                        'assets/images/logo.png',
                        scale: 2,
                      ),
                      SizedBox(height:10),
                      Container(
                         // color: Colors.white.withOpacity(0.5),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: Column(
                              children: [
                                TextField(
                                    controller: _namecontroller,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      prefixIcon: Icon(Icons.person),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(28.0),
                                        borderSide: BorderSide(
                                          color: Colors.brown,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(28.0),
                                        borderSide: BorderSide(
                                          color: Colors.brown,
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 10),
                                TextField(
                                    controller: _emcontroller,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      prefixIcon: Icon(Icons.email),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(28.0),
                                        borderSide: BorderSide(
                                          color: Colors.brown,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(28.0),
                                        borderSide: BorderSide(
                                          color: Colors.brown,
                                        ),
                                      ),
                                      hintText: "Enter Email Address",
                                    )),
                                SizedBox(height: 10),
                                TextField(
                                  controller: _pscontroller,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    prefixIcon: Icon(Icons.lock),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(28.0),
                                      borderSide: BorderSide(
                                        color: Colors.brown,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(28.0),
                                      borderSide: BorderSide(
                                        color: Colors.brown,
                                      ),
                                    ),
                                    hintText: "Enter Password",
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
                                  ),
                                  obscureText: _passwordVisible,
                                ),
                                SizedBox(height: 30),
                                Row(children: [
                                  MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  minWidth: 120,
                                  height: 50,
                                  child: Text('Reset'),
                                  color: Colors.black,
                                  textColor: Colors.orange[300],
                                  elevation: 15,
                                  onPressed: _onReset,
                                ),
                                SizedBox(width:40),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  minWidth: 120,
                                  height: 50,
                                  child: Text('Register'),
                                  color: Colors.black,
                                  textColor: Colors.orange[300],
                                  elevation: 15,
                                  onPressed: _onRegister,
                                ),
                                
                                ],)
                              ],
                            ),
                          )),
                          SizedBox(height:70),
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
                    ])))));
  }

  void _onRegister() async {
    _name = _namecontroller.text;
    _email = _emcontroller.text;
    _password = _pscontroller.text;

    if (_name.isEmpty || _email.isEmpty || _password.isEmpty) {
      Toast.show(
        "Please check your input",
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.TOP,
      );
      return;
    }
    if (!validateEmail(_email) && !validatePassword(_password)) {
      Toast.show(
        "Check your email/password",
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.TOP,
      );
      return;
    }
    ProgressDialog pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    pr.style(message: "Registration...");
    await pr.show();
    http.post("https://yhkywy.com/aroop/php/registeruser.php", body: {
      "name": _name,
      "email": _email,
      "password": _password,
    }).then((res) {
      print(res.body);
      if (res.body == "success") {
        Toast.show(
          "Registration success. An email has been sent to .$_email. Please check your email for OTP verification. Also check in your spam folder.",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.TOP,
        );
      } else {
        Toast.show(
          "Registration failed",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.TOP,
        );
      }
    }).catchError((err) {
      print(err);
    });
    await pr.hide();
  }

  void _onLogin() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool validatePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  _changeToSignIn() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  _changeToSignUp() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => RegisterScreen()));
  }

  
}
