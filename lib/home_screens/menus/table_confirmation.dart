import 'package:flutter/material.dart';
import 'package:tastybite/home_screens/restaurant_menu.dart';

class TableConfirmation extends StatelessWidget {
  const TableConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reservar',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Mesa para X pessoas reservada!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Review reservation
              },
              child: const Text('Rever Reserva'),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                // Redirect to the menu page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RestaurantMenu(),
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
