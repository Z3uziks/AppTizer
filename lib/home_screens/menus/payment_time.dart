import 'package:flutter/material.dart';
import 'package:tastybite/home_screens/menus/order_confirmation.dart';
import 'package:tastybite/home_screens/menus/table_confirmation.dart';

class PaymentTime extends StatelessWidget {
  const PaymentTime({Key? key}) : super(key: key);

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
              'Onde pretende pagar?',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Redirect to the payment method page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderConfirmation(),
                  ),
                );
              },
              child: const Text('Na Aplicação'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Redirect to the payment method page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TableConfirmation(),
                  ),
                );
              },
              child: const Text('No Restaurante'),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar Atrás'),
            ),
          ],
        ),
      ),
    );
  }
}
