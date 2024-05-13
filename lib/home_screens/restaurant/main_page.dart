import 'package:flutter/material.dart';

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

class RestaurantMainPage extends StatelessWidget {
  const RestaurantMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant tables'),
      ),
      body: SingleChildScrollView(
        child: GridView.count(
          physics:
              NeverScrollableScrollPhysics(), // Disable GridView's scrolling
          shrinkWrap: true, //
          crossAxisCount: 2, // Number of columns in the grid
          padding: EdgeInsets.all(16.0),
          children: const [
            TableIcon(
                tableName: 'Table 1',
                iconData: Icons.table_restaurant,
                reserved: true),
            TableIcon(
                tableName: 'Table 2',
                iconData: Icons.table_restaurant,
                reserved: false),
            TableIcon(
                tableName: 'Table 3',
                iconData: Icons.table_restaurant,
                reserved: false),
            TableIcon(
                tableName: 'Table 4',
                iconData: Icons.table_restaurant,
                reserved: true),
            TableIcon(
                tableName: 'Table 5',
                iconData: Icons.table_restaurant,
                reserved: false),
            TableIcon(
                tableName: 'Table 6',
                iconData: Icons.table_restaurant,
                reserved: false),
            TableIcon(
                tableName: 'Table 7',
                iconData: Icons.table_restaurant,
                reserved: false),
            TableIcon(
                tableName: 'Table 8',
                iconData: Icons.table_restaurant,
                reserved: false),
            // Add more table icons as needed
          ],
        ),
      ),
    );
  }
}
