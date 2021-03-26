//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:waka/providers/paymentsprovider.dart';
import 'package:provider/provider.dart';

class ViewPayments extends StatefulWidget {
  @override
  _ViewPaymentsState createState() => _ViewPaymentsState();
}

class _ViewPaymentsState extends State<ViewPayments> {
  @override
  Widget build(BuildContext context) {
    var paymentsProvider = Provider.of<PaymentsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("View Payments")),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Payment ID',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Tenant ID',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                  label: Text(
                'Payment for',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
              DataColumn(
                  label: Text(
                'Period',
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
                'Amount',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
              DataColumn(
                  label: Text(
                'Balance',
                style: TextStyle(fontStyle: FontStyle.italic),
              )),
            ],
            rows: _paymentRows(),
          ),
        ));
  }

  List<DataRow> _paymentRows() {
    var paymentsProvider = Provider.of<PaymentsProvider>(context);
    return paymentsProvider.getPaymentsList
        .map(
          (data) => DataRow(
            cells: [
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.paymentId),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.tenantId),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.paymentFor),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.forPeriodOf),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.startDate.toString()),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.endDate.toString()),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.amount),
                ),
              ),
              DataCell(
                Container(
                  width: 100,
                  child: Text(data.balance),
                ),
              ),
            ],
          ),
        )
        .toList();
  }
}
