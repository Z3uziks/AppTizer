import 'package:flutter/material.dart';
import 'package:tastybite/home_screens/menus/payment_method.dart';
import 'package:tastybite/home_screens/restaurant_menu.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Compra e Pagamento',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Divider(
                      color: Colors.blue,
                      thickness: 1,
                      height: 1,
                    ),
                    Container(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        'Pratos Principais',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'Grelhado de Frango:       1\n'
                  'Grelhado de Carne:         2',
                  style: TextStyle(fontSize: 20),
                ),
            const SizedBox(height: 30),
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Divider(
                      color: Colors.blue,
                      thickness: 1,
                      height: 1,
                    ),
                    Container(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        'Bebidas',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                  const Text(
                    'Vazio',
                    style: TextStyle(fontSize: 20),
                  ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Total: 110,00 €',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentMethod(),
                  ),
                );
              },
              child: const Text('Confirmar Compra'),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
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
