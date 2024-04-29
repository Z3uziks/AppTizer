import 'package:flutter/material.dart';
import 'package:tastybite/home_screens/menus/table_confirmation.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

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
              'Como pretende pagar?',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Redirect to the table confirmation page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TableConfirmation(),
                  ),
                );
              },
              child: Image.asset('assets/payments/mbway.png'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement PayPal payment
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TableConfirmation(),
                  ),
                );
              },
              child: const Text('PAYPAL'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement Cartão payment
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TableConfirmation(),
                  ),
                );
              },
              child: const Icon(Icons.credit_card),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }
}
