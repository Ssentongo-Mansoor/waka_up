import 'package:flutter/material.dart';
//import 'package:waka/add_tenant.dart';
import 'package:waka/landlord_dashboard.dart';
import 'package:waka/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:form_validator/form_validator.dart';
import 'package:waka/custom_color.dart';
import 'package:waka/custom_color.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  //Declaring text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  //bool visible = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _validateUserInput() {
    if (_loginFormKey.currentState.validate()) {
      print("User login input data is valid");
      LandLordDashboard();
    } else {
      print('Not validated');
    }
  }

  //UserModel _user;

  Future<UserModel> loginUser(String email, String password) async {
    final String apiUrl = ""; // api url will go here

    final response = await http.post(apiUrl, body: {
      //data here
    });
    if (response.statusCode == 200) {
      final String responseString = response.body;

      return userModelFromJson(responseString);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Sign in")),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          padding: EdgeInsets.all(15.0),
          width: 360.0,
          height: 420.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Sign in",
                  style: TextStyle(color: Colors.purple[900], fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Email",
                    ),
                  ],
                ),
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Enter you email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),

                  //validator : ValidationBuilder().email.maxLength(20).build();
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Password"),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.purple[900]),
                    )
                  ],
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Enter you password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                Container(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () async {
                      /*
                      final String email = emailController.text;
                      final String password = passwordController.text;

                      final UserModel user = await loginUser(email, password);

                      setState(() {
                        _user = user;
                      });
                      _user == null
                          ? Text("Email annd password do not match")
                          : */
                      //temporary code
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LandLordDashboard()),
                      );
                    },
                    child: Text('Login'),
                  ),
                ),
                Text("Our Terms and Conditions"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
