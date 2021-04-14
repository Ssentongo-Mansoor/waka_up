import 'dart:core';
import 'dart:convert';
import 'package:form_validator/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:waka/views/landlord_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:waka/views/custom_color.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool dontShowPassword;
  bool visible;
  bool _connection;

  @override
  void initState() {
    super.initState();
    visible = false;
    dontShowPassword = true;
    _connection = false;
    // initialize our objects in here
  }

  checkForInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // return true;
        setState(() {
          _connection = true;
        });
      }
    } on SocketException catch (e) {
      print("Connection problem: " + e.toString());
      // return false;
      setState(() {
        _connection = false;
      });
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _validateUserInput() async {
    final noInternetSnackBar = SnackBar(
      content: Text('You are offline!'),
    );
    if (_loginFormKey.currentState.validate()) {
      print("User login input data is valid");
      try {
        await checkForInternetConnection();
        await Future.delayed(Duration(milliseconds: 100));
      } catch (e) {
        throw "Error checking for Internet: " + e.toString();
      }

      _connection
          ? userLogin()
          : _scaffoldKey.currentState.showSnackBar(noInternetSnackBar);
    } else {
      print('Not validated');
    }
  }

  _launchPrivacyPolicyURL() async {
    const url = 'https://wakaug.com/techie/privacy-policy.php';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future userLogin() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String email = _emailController.text;
    String password = _passwordController.text;

    // SERVER LOGIN API URL
    /* API Offline
    var url = 'http://192.168.43.254/waka/v1.0/requests/user/login.php';
    */

    //API Online
    var url = 'http://api.wakaug.com/v1.0/requests/user/login.php';

    // Store all data with Param Name.
    var data = {'email': email, 'password': password};

    // Starting Web API Call.
    var response;
    try {
      response = await http.post(url, body: jsonEncode(data), headers: {
        "Content-Type": "application/json",
        'Connection': 'keep-alive',
      });
    } catch (e) {
      print("Error: " + e.toString());
    }

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'successful') {
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });
      //after the login REST api call && response code ==200
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      // prefs.setString('password', password);
      // Navigate to Profile Screen & Sending Email to Next Screen.
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LandLordDashboard()));
      print('Login Status: Successful');
      print('User Email: ' + email);
    } else {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });
      final snackBar = SnackBar(
        content: Text(message),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      key: _scaffoldKey,
      body: portraitModeLayout(context),
      /*
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? portraitModeLayout(context)
          : landscapeModeLayout(context),
          */
    );
  }

  Widget portraitModeLayout(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        padding: EdgeInsets.all(15.0),
        width: 360.0,
        height: 420.0,
        child: SingleChildScrollView(
            child: Center(
          child: Form(
              key: _loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "Sign in",
                      style: TextStyle(color: myColor, fontSize: 30),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text("Email"),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                          child: TextFormField(
                            controller: _emailController,
                            cursorColor: Colors.black,
                            style: TextStyle(fontSize: 14.0, height: 1.2),
                            decoration: InputDecoration(
                                hintText: "Enter your email",
                                labelText: "Email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            validator: ValidationBuilder()
                                .email()
                                .maxLength(100)
                                .build(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text("Password"),
                        SizedBox(
                          width: 120,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: TextFormField(
                        obscureText: this.dontShowPassword,
                        controller: _passwordController,
                        cursorColor: Colors.black,
                        style: TextStyle(fontSize: 14.0, height: 1.2),
                        decoration: InputDecoration(
                            hintText: "Enter your password",
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.security),
                              color: this.dontShowPassword
                                  ? Colors.black
                                  : Colors.blue,
                              onPressed: () {
                                setState(() {
                                  this.dontShowPassword =
                                      !this.dontShowPassword;
                                });
                              },
                            )),
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return "* Required";
                          } else
                            return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      width: 300.0,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            await _validateUserInput();
                          } catch (e) {
                            throw "Error validating: " + e.toString();
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 9.0, 0.0, 9.0),
                          child: Text(
                            'Login',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        try {
                          _launchPrivacyPolicyURL();
                        } catch (e) {
                          throw "Problem with Privacy Policy URL Launcher: " +
                              e.toString();
                        }
                      },
                      child: Text(
                        'Our Privacy Policy',
                        style: TextStyle(color: Colors.blue, fontSize: 15.0),
                      ),
                    ),
                    Visibility(
                        visible: visible,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: CircularProgressIndicator(),
                        )),
                    SizedBox(
                      height: 130.0,
                    ),
                  ])),
        )),
      ),
    );
  }
}
