import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Endereço: 123 Main Street',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Text(
              'Telefone 1: 123-456-7890',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Text(
              'Telefone 2: 098-765-4321',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Text(
              'Website: www.ramona.com',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Text(
              'Horário de Funcionamento: 10:00 - 22:00',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Text(
              'Avaliação: 4.5',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
