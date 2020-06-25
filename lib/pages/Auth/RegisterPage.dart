import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile/pages/Auth/LoginPage.dart';
import 'package:mobile/pages/User/ProfilePage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // set password visibility
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  /* CREATE ACCOUNT */
  _createAccount(String email, String name, String password) async {
    // set up POST request arguments
    String url = 'http://10.0.2.2:5000/authentication/register';
    Map<String, String> headers = {"Content-type": "application/json"};
    final jsonData = json.encode({
      'email': emailController.text,
      'name': userNameController.text,
      'password': passwordController.text
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding:
            EdgeInsets.only(top: 80.0, right: 20.0, left: 20.0, bottom: 10.0),
        child: Center(
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
                height: 20.0,
              ),
              Text(
                "Create your Account",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 25.0,
              ),
              buildTextField("User Name", userNameController),
              SizedBox(
                height: 20.0,
              ),
              buildTextField("Email", emailController),
              SizedBox(
                height: 20.0,
              ),
              buildTextField("Password", passwordController),
              SizedBox(
                height: 20.0,
              ),
              buildTextField("Confirm Password", confirmPasswordController),
              SizedBox(height: 40.0),
              buildRegisterBtn(),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account? "),
                      SizedBox(
                        width: 10.0,
                      ),
                      InkWell(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
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
        prefixIcon: hintText == "Email"
            ? Icon(Icons.email)
            : hintText == "Password"
                ? Icon(Icons.lock)
                : hintText == "Confirm Password"
                    ? Icon(Icons.lock)
                    : hintText == "User Name" ? Icon(Icons.person) : null,
        suffixIcon: hintText == "Password" || hintText == "Confirm Password"
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

  Widget buildRegisterBtn() {
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
          print('SIGN UP BUTTON');
          print(userNameController.text);
          print(emailController.text);
          print(passwordController.text);
          print(confirmPasswordController.text);
          if (passwordController.text != confirmPasswordController.text) {
            _createAccount(emailController.text, userNameController.text,
                passwordController.text);
          } else {
            print('Password is not the same as confirm password');
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}
