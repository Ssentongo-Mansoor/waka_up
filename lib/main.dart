import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:waka/views/LoginPage.dart';
import 'package:waka/views/custom_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waka/views/landlord_dashboard.dart';
import 'package:provider/provider.dart';
import 'package:waka/providers/paymentsprovider.dart';
import 'package:waka/providers/subscriptionsprovider.dart';
import 'package:waka/providers/tenantsprovider.dart';
import 'package:waka/providers/roomsprovider.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Center(child: Text('Welcome to Waka')),
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Waka",
            style: TextStyle(color: myColor, fontSize: 125),
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
