import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'mainscreen.dart';
import 'package:flutter/services.dart';
import 'registerscreen.dart';
import 'user.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _signUpActive = false;
  bool _signInActive = true;
  @override
  final TextEditingController _emcontroller = TextEditingController();
  final TextEditingController _pscontroller = TextEditingController();
  String _email = "";
  String _password = "";

  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                color: Colors.tealAccent[200],
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                    child: Column(children: [
                      SizedBox(height: 30),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlineButton(
                              onPressed: () => _changeToSignUp(),
                              borderSide: BorderSide(
                                style: BorderStyle.none,
                              ),
                              child: Text("Sign up",
                                  style: _signUpActive
                                      ? TextStyle(
                                          fontSize: 22,
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.bold)
                                      : TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.normal)),
                            ),
                            OutlineButton(
                              onPressed: () => _changeToSignIn(),
                              borderSide: new BorderSide(
                                style: BorderStyle.none,
                              ),
                              child: new Text("Sign in",
                                  style: _signInActive
                                      ? TextStyle(
                                          fontSize: 30,
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.bold)
                                      : TextStyle(
                                          fontSize: 24,
                                          color: Theme.of(context).accentColor,
                                          fontWeight: FontWeight.normal)),
                            ),
                          ]),
                      SizedBox(height: 30),
                      Image.asset(
                        'assets/images/logo.png',
                        scale: 2,
                      ),
                      SizedBox(height: 10),
                      Container(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                            TextField(
                                controller: _emcontroller,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
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
                                    color: Theme.of(context).primaryColorDark,
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
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(children: [
                                SizedBox(
                                  height: 20,
                                  width: 130,
                                ),
                                GestureDetector(
                                    onTap: _forgotPass,
                                    child: Text('Forgot Password?',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.brown[50]))),
                              ]),
                            ),
                            SizedBox(height: 30),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              minWidth: 200,
                              height: 50,
                              child: Text('Login'),
                              color: Colors.black,
                              textColor: Colors.orange[300],
                              elevation: 15,
                              onPressed: _onLogin,
                            ),
                            
                          ],
                        )),
                      )),
                      SizedBox(height:60),
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

  Future<void> _onLogin() async {
    _email = _emcontroller.text;
    _password = _pscontroller.text;
    ProgressDialog pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    pr.style(message: "Login...");
    await pr.show();
    http.post("https://yhkywy.com/aroop/php/loginuser.php", body: {
      "email": _email,
      "password": _password,
    }).then((res) {
      print(res.body);
      List userdata = res.body.split(",");
      if (userdata[0] == "success") {
        Toast.show(
          "Login Success",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.TOP,
        );
        User user = new User(
            email: _email,
            name: userdata[1],
            password: _password,
            );

        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => MainScreen(user:user)));
      } else {
        Toast.show(
          "Login failed",
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

  

    void _forgotPass() {
    TextEditingController emailController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Forgot Password?"),
          content: new Container(
            height: 60,
            child: Column(
              children: <Widget>[
                TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ))
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              textColor: Colors.purple[500],
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              textColor: Colors.purple[500],
              child: new Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
                print(emailController.text);
                _findpassword(emailController.text);
              },
            ),
          ],
        );
      },
    );
  }
 void _findpassword(String email) {
    String _email = email;
    TextEditingController pwdController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Enter new password?"),
          content: new Container(
            height: 100,
            child: Column(
              children: <Widget>[
                TextField(
                    controller: pwdController,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                    ))
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              textColor: Colors.purple[500],
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              textColor: Colors.purple[500],
              child: new Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
                _changepassword(_email, pwdController.text);
                   Toast.show("Password updated successfully", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              },
            ),
          ],
        );
      },
    );
  }

  void _changepassword(String ownemail, String newpassword) {
    if (newpassword == "" || newpassword == null || newpassword.length < 6) {
      Toast.show("Please enter more than 6 words new password", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return;
    }
    http.post("http://yhkywy.com/aroop/php/resetpass.php", body: {
      "email": ownemail,
      "newpassword": newpassword,
    }).then((res) {
      if (res.body == "success") {
        Toast.show("Success", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        return;
      } else {}
    }).catchError((err) {
      print(err);
    });
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

  Future<bool> _onBackPressAppBar() async {
    SystemNavigator.pop();
    print('Backpress');
    return Future.value(false);
  }

  _changeToSignUp() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => RegisterScreen()));
  }

  _changeToSignIn() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }
}
