//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waka/providers/subscriptionsprovider.dart';
import 'package:async/async.dart';

class ViewUnitsSubscriptions extends StatefulWidget {
  @override
  _ViewUnitsSubscriptionsState createState() => _ViewUnitsSubscriptionsState();
}

class _ViewUnitsSubscriptionsState extends State<ViewUnitsSubscriptions> {
  final AsyncMemoizer _memoizerUnitsSubscriptions = AsyncMemoizer();
  @override
  Widget build(BuildContext context) {
    var subscriptionsProvider = Provider.of<SubscriptionsProvider>(context);
    final _unitsSubscriptionFuture =
        this._memoizerUnitsSubscriptions.runOnce(() async {
      await Future.delayed(Duration(seconds: 2));
      return subscriptionsProvider.getUnitsSubscriptionsInfo();
    });
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Units Subscriptions")),
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
        body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder(
              future: _unitsSubscriptionFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  try {
                    return DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Room ID',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                            label: Text(
                          'Tenant ID',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )),
                        DataColumn(
                            label: Text(
                          'Start Date',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )),
                        DataColumn(
                            label: Text(
                          'End Date',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )),
                        DataColumn(
                            label: Text(
                          'Price',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )),
                        DataColumn(
                            label: Text(
                          'Paid',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )),
                        DataColumn(
                            label: Text(
                          'Remaining',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )),
                        DataColumn(
                            label: Text(
                          'Reference Code',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )),
                      ],
                      rows: _subscriptionsRows(),
                    );
                  } catch (e) {
                    print("Error with snapshot: " + e.toString());
                  }
                }
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )));
  }

  List<DataRow> _subscriptionsRows() {
    var subscriptionsProvider = Provider.of<SubscriptionsProvider>(context);
    return subscriptionsProvider.getSubscriptionsList
        .map(
          (data) => DataRow(
            cells: [
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.roomid),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.tenantid),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.startdate),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.enddate),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.price.toString()),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.paid.toString()),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.remaining),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.refCode),
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}
