import 'package:flutter/material.dart';

class BuildingManagerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dashboard")),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  "Rooms",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
                Text("2", style: TextStyle(color: Colors.black, fontSize: 20))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  "Tenants",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
                Text("2", style: TextStyle(color: Colors.black, fontSize: 20))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  "Occupied Rooms",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
                Text("2", style: TextStyle(color: Colors.black, fontSize: 20))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  "Vacant Rooms",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
                Text("0", style: TextStyle(color: Colors.black, fontSize: 20))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  "Rent Collected",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
                Text("300,000/=",
                    style: TextStyle(color: Colors.black, fontSize: 20))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                    child: Text(
                  "Payments",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
                Text("150,000/=",
                    style: TextStyle(color: Colors.black, fontSize: 20))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
