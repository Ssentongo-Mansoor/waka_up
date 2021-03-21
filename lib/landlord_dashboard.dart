import 'package:flutter/material.dart';
import 'package:waka/main.dart';
import 'package:waka/view_tenants.dart';
import 'package:waka/view_units.dart';
import 'package:waka/view_payments.dart';
import 'package:waka/account.dart';

class LandLordDashboard extends StatefulWidget {
  @override
  _LandLordDashboardState createState() => _LandLordDashboardState();
}

class _LandLordDashboardState extends State<LandLordDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Dashboard")),
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
              icon: new IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Account()));
                },
              ),
              label: 'Account')
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Center(
              child: DrawerHeader(
                child: new Icon(Icons.account_circle_rounded),
                decoration: BoxDecoration(color: Colors.amberAccent[50]),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
                leading: Icon(Icons.person),
                title: Text("View Tenants"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewTenants()),
                  );
                }),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text("Unit Subscriptions"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewUnits()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text("View Payments"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewPayments()),
                );
              },
            ),
            ListTile(
                leading: Icon(Icons.book),
                title: Text("Expense records"),
                onTap: () {}),
            ListTile(
              leading: Icon(Icons.power),
              title: Text("Electricity Usage"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.waves),
              title: Text("Water Usage"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text("Balances"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: null,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/phone.png"))),
                ),
                //Icon(Icons.house),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                        child: Text(
                      "Rooms",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
                    Text("2",
                        style: TextStyle(color: Colors.black, fontSize: 20))
                  ],
                ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: null,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/phone.png"))),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                        child: Text(
                      "Tenants",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
                    Text("2",
                        style: TextStyle(color: Colors.black, fontSize: 20))
                  ],
                ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: null,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/phone.png"))),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                        child: Text(
                      "Occupied Rooms",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
                    Text("2",
                        style: TextStyle(color: Colors.black, fontSize: 20))
                  ],
                ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: null,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/phone.png"))),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                        child: Text(
                      "Vacant Rooms",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
                    Text("0",
                        style: TextStyle(color: Colors.black, fontSize: 20))
                  ],
                ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: null,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/phone.png"))),
                ),
                Column(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: null,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/phone.png"))),
                ),
                Column(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
