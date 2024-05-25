import 'dart:math';

import 'package:flutter/material.dart';

class TableInfo extends StatelessWidget {
  final Map<String, dynamic> tableData;

  const TableInfo({
    required this.tableData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orders = tableData['orders'] as List? ?? [];
    return Scaffold(
      appBar: AppBar(
        title: Text(tableData['tableName']),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                ' Pedidos:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: orders.isEmpty
                ? Center(child: Text('Sem pedidos', style: TextStyle(fontSize: 24))) // display this when there are no orders
                : ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      var order = orders[index];
                      return Center( // wrap ListTile with Center
                        child: ListTile(
                          title: Text(order['orderName'], textAlign: TextAlign.center, style: TextStyle(fontSize: 20)), // center text
                          subtitle: Text('Pratos: ' + order['orderQuantity'], textAlign: TextAlign.center, style: TextStyle(fontSize: 20)), // center text
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
