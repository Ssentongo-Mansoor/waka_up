import 'package:flutter/material.dart';
import 'package:waka/views/view_tenants.dart';
import 'package:waka/views/view_units.dart';
import 'package:waka/views/view_units_subscriptions.dart';
import 'package:waka/views/view_payments.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waka/views/LoginPage.dart';
import 'package:provider/provider.dart';
import 'package:waka/providers/totalunitsprovider.dart';
import 'package:waka/providers/total_tenants_provider.dart';
import 'package:waka/providers/occupied_rooms_provider.dart';
import 'package:waka/providers/total_vaccant_rooms_provider.dart';
import 'package:waka/providers/total_payments_provider.dart';
import 'package:async/async.dart';

class LandLordDashboard extends StatefulWidget {
  @override
  _LandLordDashboardState createState() => _LandLordDashboardState();
}

class _LandLordDashboardState extends State<LandLordDashboard> {
  final AsyncMemoizer _memoizerTotalUnits = AsyncMemoizer();
  final AsyncMemoizer _memoizerTotalTenants = AsyncMemoizer();
  final AsyncMemoizer _memoizerOccupiedRooms = AsyncMemoizer();
  final AsyncMemoizer _memoizerVaccantRooms = AsyncMemoizer();
  final AsyncMemoizer _memoizerTotalPayments = AsyncMemoizer();
  Future<bool> showExitPopup() async {
    return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Exit Waka'),
                  content: ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: 100,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Do you want to exit?'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: Text('No'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                SystemNavigator.pop(animated: true);
                              },
                              child: Text('Yes'),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  actions: [],
                )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    var _totalUnitsProvider = Provider.of<TotalUnitsProvider>(context);
    var _totalTenantsProvider = Provider.of<TotalTenantsProvider>(context);
    var _totalRoomsOccupiedProvider =
        Provider.of<TotalOccupiedRoomsProvider>(context);
    var _totalVaccantRoomsProvider =
        Provider.of<TotalVaccantRoomsProvider>(context);
    //var _totalTenantsProvider = Provider.of<TenantsProvider>(context);
    var _totalPaymentsProvider = Provider.of<TotalPaymentsProvider>(context);
    final _totalUnitsFuture = this._memoizerTotalUnits.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));
      return _totalUnitsProvider.getTotalUnitsInfo();
    });

    final _totalTenantsFuture = this._memoizerTotalTenants.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));
      return _totalTenantsProvider.getTotalTenantsInfo();
    });

    final _totalOccupiedRoomsFuture =
        this._memoizerOccupiedRooms.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));
      return _totalRoomsOccupiedProvider.getTotalOccupiedRoomsInfo();
    });

    final _totalVaccantRoomsFuture =
        this._memoizerVaccantRooms.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));
      return _totalVaccantRoomsProvider.getTotalVaccantRoomsInfo();
    });

    final _totalPaymentsFuture = this._memoizerTotalPayments.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));
      return _totalPaymentsProvider.getTotalPaymentsInfo();
    });

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Dashboard")),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Center(
                child: DrawerHeader(
                  child: Container(),
                  decoration: BoxDecoration(
                      color: Colors.amberAccent[50],
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/images/waka_logo_header.png'))),
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
                title: Text("View Units"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewUnits()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text("Unit Subscriptions"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewUnitsSubscriptions()),
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
                leading: Icon(Icons.logout),
                title: Text("Log Out"),
                onTap: () async {
                  showLogoutAlertDialog(context);
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
                            image: AssetImage("assets/images/units.png"))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                          child: Text(
                        "Units",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                      FutureBuilder(
                        future: _totalUnitsFuture,
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.hasData) {
                            try {
                              return Text(_totalUnitsProvider
                                  .getTotalUnitsObject.totalunits
                                  .toString());
                            } catch (e) {
                              print(
                                  'Error with returned data: ' + e.toString());
                            }
                          }

                          if (snapshot.hasError) {
                            return Text('Something occurred');
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )
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
                            image: AssetImage("assets/images/tenants.png"))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                          child: Text(
                        "Tenants",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                      FutureBuilder(
                        future: _totalTenantsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            try {
                              return Text(_totalTenantsProvider
                                  .getTotalTenantsObject.totaltenants
                                  .toString());
                            } catch (e) {
                              print("Error in Tenants Future: " + e.toString());
                            }
                          }
                          if (snapshot.hasError) {
                            return Text("Something went wrong");
                          }

                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )
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
                            image: AssetImage(
                                "assets/images/occupied_rooms.png"))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                          child: Text(
                        "Occupied Rooms",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                      FutureBuilder(
                        future: _totalOccupiedRoomsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            try {
                              return Text(_totalRoomsOccupiedProvider
                                  .getTotalOccupiedRoomsObject
                                  .totaloccupiedrooms
                                  .toString());
                            } catch (e) {
                              print("Error with Snapshot");
                            }
                          }
                          if (snapshot.hasError) {
                            return Text("Something went wrong");
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )
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
                            image:
                                AssetImage("assets/images/vaccant_rooms.png"))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                          child: Text(
                        "Vacant Rooms",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                      FutureBuilder(
                        future: _totalVaccantRoomsFuture,
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.hasData) {
                            try {
                              return Text(_totalVaccantRoomsProvider
                                  .getTotalVaccantRoomsObject.totalvaccantrooms
                                  .toString());
                            } catch (e) {
                              print("Error in the snapshot" + e.toString());
                            }
                          }
                          if (snapshot.hasError) {
                            return Text("Something went wrong");
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )
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
                            image: AssetImage("assets/images/payments.png"))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                          child: Text(
                        "Payments",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                      FutureBuilder(
                        future: _totalPaymentsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            try {
                              return Text(_totalPaymentsProvider
                                  .getTotalPaymentsModel.totalPayments
                                  .toString());
                            } catch (e) {
                              print("Error in snapshot" + e.toString());
                            }
                          }
                          if (snapshot.hasError) {
                            return Text("Something went wrong");
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showLogoutAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () async {
        Navigator.pop(context);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('email');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (BuildContext ctx) => Login()));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm Logout"),
      content: Text("Proceed to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
