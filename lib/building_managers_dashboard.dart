import 'package:flutter/material.dart';
import 'package:waka/add_tenant.dart';
import 'package:waka/main.dart';

class BuildingManagerDashboard extends StatefulWidget {
  @override
  _BuildingManagerDashboardState createState() =>
      _BuildingManagerDashboardState();
}

class _BuildingManagerDashboardState extends State<BuildingManagerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" Dashboard")),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        iconSize: 25.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: new Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person), label: 'Account')
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Center(
              child: DrawerHeader(
                child: new Icon(Icons.people),
                decoration: BoxDecoration(color: Colors.amberAccent[50]),
              ),
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
                title: Text("Manage Tenants"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTenant()),
                  );
                }),
            ListTile(
              title: Text("Unit Subscriptions"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Manage Payments"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Manage "),
              onTap: () {},
            ),
            ListTile(
              title: Text("Expense records"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Electricity Usage"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Water Usage"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Balances"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Log Out"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
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
