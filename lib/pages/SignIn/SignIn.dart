import 'dart:convert';

import 'package:blog_mobile/api/User.dart';
import 'package:blog_mobile/constants/ApiRoutes.dart';
import 'package:blog_mobile/constants/Constants.dart';
import 'package:blog_mobile/utils/FadeAnimation.dart';
import 'package:blog_mobile/utils/FormValidator.dart';
import 'package:blog_mobile/widgets/Loaders/Loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _globalkey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final storage = new FlutterSecureStorage();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  NetworkHandler networkHandler = NetworkHandler();
  bool btnLoading = false;
  bool _passwordVisible = false;

  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalkey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Text("Login",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold))),
                      SizedBox(height: 20),
                      FadeAnimation(
                          1.2,
                          Text("Login to your account",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]))),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                              1.2,
                              formInput(
                                  label: "Email",
                                  obscureText: false,
                                  controller: _emailController)),
                          FadeAnimation(
                              1.3,
                              formInput(
                                  label: "Password",
                                  obscureText: true,
                                  controller: _passwordController)),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('/forgot_password');
                                },
                                child: Text("Forgot Password?",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  FadeAnimation(
                      1.4,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                            padding: EdgeInsets.only(top: 3, left: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border(
                                  bottom: BorderSide(color: Colors.black),
                                  top: BorderSide(color: Colors.black),
                                  left: BorderSide(color: Colors.black),
                                  right: BorderSide(color: Colors.black),
                                )),
                            child: MaterialButton(
                              shape: btnLoading
                                  ? CircleBorder()
                                  : RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                              onPressed: () => btnLoading ? null : SignIn(),
                              minWidth: double.infinity,
                              height: 60,
                              color: Colors.greenAccent,
                              elevation: 0,
                              child: btnLoading
                                  ? CircularProgressIndicator(
                                      backgroundColor: Constants.white,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Constants.yellow))
                                  : Text("Login",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18)),
                            )),
                      )),
                  FadeAnimation(
                      1.5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account?"),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/sign_up');
                            },
                            child: Text("Sign up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18)),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            FadeAnimation(
                1.2,
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.cover)),
                ))
          ],
        ),
      ),
    );
  }

  Widget formInput({label, controller, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (label == "Email")
              ? FormValidate.validateName
              : FormValidate.validatePassword,
          obscureText: obscureText
              ? (obscureText ? _passwordVisible : !_passwordVisible)
              : false,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: obscureText
                ? IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Constants.bgColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  )
                : null,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  void SignIn() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        btnLoading = true;
      });
      Map<String, String> data = {
        "username": _emailController.text,
        "password": _passwordController.text,
      };
      print('DATA IS ${data}');
      var response = await networkHandler.post(ApiRoutes.login, data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> output = json.decode(response.body);
        print(output["token"]);
        await storage.write(key: "token", value: output["token"]);
        Navigator.of(context).pushNamed('/blog_home');
      } else {
        String output = json.decode(response.body);
        print('output $output');
        ScaffoldMessenger.of(context).showSnackBar(Loaders.messageSnackbar(
          fontSize: 15.0,
          title: output.toString(),
          onClick: SnackBarAction(
            label: 'Dismiss',
            textColor: Colors.white,
            onPressed: () => {
              setState(() {
                // loading = false;
              })
            },
          ),
        ));
        setState(() {
          btnLoading = false;
        });
      }
    }
  }
}
