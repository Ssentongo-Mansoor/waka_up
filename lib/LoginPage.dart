import 'package:flutter/material.dart';
//import 'package:waka/add_tenant.dart';
import 'package:waka/building_managers_dashboard.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Sign in")),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: 350.0,
          height: 420.0,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Sign in",
                  style: TextStyle(color: Colors.red, fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Email",
                    ),
                  ],
                ),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Enter you email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Password"),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                TextField(
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BuildingManagerDashboard()),
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
