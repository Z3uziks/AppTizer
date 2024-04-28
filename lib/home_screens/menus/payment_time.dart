import 'package:flutter/material.dart';
import 'package:tastybite/home_screens/menus/payment_method.dart';

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
              'Quando pretende pagar?',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Redirect to the payment method page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentMethod(),
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
                    builder: (context) => const PaymentMethod(),
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
              child: const Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }
}