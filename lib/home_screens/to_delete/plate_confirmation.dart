import 'package:flutter/material.dart';
import 'package:tastybite/home_screens/menus/menuitemspage.dart';
import 'package:tastybite/home_screens/restaurant_menu.dart';
import 'package:tastybite/home_screens/orders_status_screen.dart';

class PlateConfirmation extends StatelessWidget {
  const PlateConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comprar',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pratos reservados!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                // Redirect to OrdersStatusScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => const OrdersStatusScreen(),
                  ),
                );
              },
              child: const Text('Voltar ao Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
