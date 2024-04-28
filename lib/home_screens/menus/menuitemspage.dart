import 'package:flutter/material.dart';

class MenuItemPage extends StatelessWidget {
  final String title;

  const MenuItemPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'This is the page for $title',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}