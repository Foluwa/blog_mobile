import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile/pages/Auth/RegisterPage.dart';
import 'package:mobile/pages/User/ProfilePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /* CREATE ACCOUNT */
  _loginAccount(String email, String password) async {
    // set up POST request arguments
    String url = 'http://10.0.2.2:5000/authentication/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    final jsonData = json.encode(
        {'email': emailController.text, 'password': passwordController.text});
    // make POST request
    Response response = await post(url, headers: headers, body: jsonData);
    // check the status code for the result
    int statusCode = response.statusCode;
    String body = response.body;
    print(statusCode);
    print('Body is ' + body);
    if (statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ),
      );
    } else {
      // ALERT ERROR
    }
  }
  /* END OF HTTP POST MethodCall */

/* Toggle visibility*/
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
/* End of Toggle visibility */

  /* Forgot Password widget*/
  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Recover your Account'),
            content: buildTextField("Email Address", emailController),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'CANCEL',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
/* End of Forgot Password widget*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding:
            EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pern Todo',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico"),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "Sign into Account",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 40.0,
            ),
            buildTextField("Email", emailController),
            SizedBox(
              height: 20.0,
            ),
            buildTextField("Password", passwordController),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  InkWell(
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onTap: () {
                      _displayDialog(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            buildLoginBtn(),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText, controllerCallback) {
    return TextField(
      controller: controllerCallback,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }

  Widget buildLoginBtn() {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.0),
        gradient: LinearGradient(colors: [
          Color(0xFFFB415B),
          Color(0xFFEE5623),
        ], begin: Alignment.centerRight, end: Alignment.centerLeft),
      ),
      child: RaisedButton(
        color: Color(0xFFFB415B),
        elevation: 3.0,
        onPressed: () {
          print('SIGN IN BUTTON');
          print(emailController.text + ' and ' + passwordController.text);
          _loginAccount(emailController.text, passwordController.text);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Text(
          'Sign IN',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}
