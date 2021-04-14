import 'package:flutter/material.dart';
import 'package:waka/views/LoginPage.dart';
import 'package:waka/views/custom_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waka/views/landlord_dashboard.dart';
import 'package:provider/provider.dart';
import 'package:waka/providers/paymentsprovider.dart';
import 'package:waka/providers/subscriptionsprovider.dart';
import 'package:waka/providers/tenantsprovider.dart';
import 'package:waka/providers/roomsprovider.dart';
import 'package:waka/providers/totalunitsprovider.dart';
import 'package:waka/providers/total_tenants_provider.dart';
import 'package:waka/providers/occupied_rooms_provider.dart';
import 'package:waka/providers/total_vaccant_rooms_provider.dart';
import 'package:waka/providers/total_payments_provider.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(WakaHome());
}

class WakaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: PaymentsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SubscriptionsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TenantsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: RoomsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TotalUnitsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TotalTenantsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TotalVaccantRoomsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TotalOccupiedRoomsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: TotalPaymentsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Waka',
        theme: ThemeData(
          primarySwatch: myColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  checkForInternetConnection() async {
    try {
      await Future.delayed(Duration(milliseconds: 500));
      final result = await InternetAddress.lookup('google.com');
      await Future.delayed(Duration(milliseconds: 500));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (e) {
      print("Connection problem: " + e.toString());
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
                color: Colors.amberAccent[50],
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/waka_logo.png'))),
          ),
          Center(
            child: FlatButton(
              child: Text('Get started',
                  style: TextStyle(
                    color: myColor,
                    fontSize: 25,
                    decoration: TextDecoration.underline,
                  )),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                var email = prefs.getString('email');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          email != null ? LandLordDashboard() : Login()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
