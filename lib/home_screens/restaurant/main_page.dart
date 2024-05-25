import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tastybite/services/locator_service.dart';
import 'package:tastybite/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tastybite/util/logout.dart';

final FirebaseAuth _auth = locator.get();
final FirebaseFirestore _firestore = locator.get();

class TableIcon extends StatefulWidget {
  final IconData iconData;
  final String tableName;
  final bool reserved;

  const TableIcon({
    required this.iconData,
    required this.tableName,
    this.reserved = false,
    Key? key,
  }) : super(key: key);

  @override
  _TableIconState createState() => _TableIconState();
}

class _TableIconState extends State<TableIcon> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    // create a list of colors
    List<Color> colors = [Colors.red, Colors.green];
    int colorIndex = widget.reserved ? 0 : 1;
    Color iconColor =
        _isPressed ? colors[(colorIndex + 1) % 2] : colors[colorIndex];

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            Icon(
              widget.iconData,
              size: MediaQuery.of(context).size.width * 0.3,
              color: iconColor,
            ),
            if (iconColor == Colors.red) // Show "booked" text if color is red
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  color: Colors.white,
                  child: Text(
                    'Booked',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
          ]),
          SizedBox(height: 10.0),
          Text(
            widget.tableName,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantMainPage extends StatefulWidget {
  RestaurantMainPage({Key? key}) : super(key: key);

  @override
  _RestaurantMainPageState createState() => _RestaurantMainPageState();
}

class _RestaurantMainPageState extends State<RestaurantMainPage> {
  List<Map<String, dynamic>> tableData = [
      {'tableName': 'Table 1', 'iconData': Icons.table_restaurant, 'reserved': true},
      {'tableName': 'Table 2', 'iconData': Icons.table_restaurant, 'reserved': false},
      {'tableName': 'Table 3', 'iconData': Icons.table_restaurant, 'reserved': false},
      {'tableName': 'Table 4', 'iconData': Icons.table_restaurant, 'reserved': true},
      {'tableName': 'Table 5', 'iconData': Icons.table_restaurant, 'reserved': false},
      {'tableName': 'Table 6', 'iconData': Icons.table_restaurant, 'reserved': false},
      {'tableName': 'Table 7', 'iconData': Icons.table_restaurant, 'reserved': false},
      {'tableName': 'Table 8', 'iconData': Icons.table_restaurant, 'reserved': false},
    ];

  void setAllTablesReserved() {
    setState(() {
      tableData = tableData.map((data) {
        data['reserved'] = true;
        return data;
      }).toList();
    });
  }

  void setAllTablesFree() {
    setState(() {
      tableData = tableData.map((data) {
        data['reserved'] = false;
        return data;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    LogoutHelper logoutHelper = Provider.of<LogoutHelper>(context);
    // Calcula a largura dos botões com base na largura da tela
    double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth / 2; // Define a largura dos botões como 1/3 da largura da tela

    bool reserved = false;
    return Scaffold(
     appBar: AppBar(
        title: Text('Restaurant tables'),
        /*actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check), // Ícone para definir todas as mesas como livres
            onPressed: setAllTablesFree, // Chama a função para definir todas as mesas como livres
          ),
          IconButton(
            icon: Icon(Icons.close), // Ícone para definir todas as mesas como ocupadas
            onPressed: setAllTablesReserved, // Chama a função para definir todas as mesas como ocupadas
          ),
        ],*/
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: buttonWidth, // Largura dos botões
                  child: ElevatedButton(
                    onPressed: setAllTablesFree,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8), // Padding vertical e horizontal
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Bordas arredondadas
                      ),
                    ),
                    child: Text('Mark All as Free'),
                  ),
                ),
                SizedBox(
                  width: buttonWidth, // Largura dos botões
                  child: ElevatedButton(
                    onPressed: setAllTablesReserved,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8), // Padding vertical e horizontal
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Bordas arredondadas
                      ),
                    ),
                    child: Text('Mark All as Reserved'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0), // Espaço entre o GridView e os botões
            GridView.count(
              physics: NeverScrollableScrollPhysics(), // Disable GridView's scrolling
              shrinkWrap: true,
              crossAxisCount: 2, // Number of columns in the grid
              padding: EdgeInsets.all(16.0),
              children: tableData.map((data) {
                return TableIcon(
                  tableName: data['tableName'],
                  iconData: data['iconData'],
                  reserved: data['reserved'],
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showLogoutConfirmationDialog(context, logoutHelper),
        child: Icon(
          Icons.logout,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }


  void _showLogoutConfirmationDialog(BuildContext context, LogoutHelper logoutHelper) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                  await AuthServices(_firestore, _auth)
                      .signOut(context, logoutHelper);
                      Navigator.of(context).pop(); // Close the dialog
                },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
