import 'package:flutter/material.dart';
import 'package:tastybite/home_screens/menus/details_page.dart';
import 'package:tastybite/home_screens/menus/menuitemspage.dart';
import 'package:tastybite/home_screens/menus/reserve_table.dart';

class RestaurantMenu extends StatelessWidget {
  const RestaurantMenu({Key? key}) : super(key: key);

  // Mapping between menu item titles and page routes
  static final Map<String, Widget> menuRoutes = {
    "Pratos": const MenuItemPage(title: "Pratos"),
    "Mesas": const ReservePage(),
    "Bebidas": const MenuItemPage(title: "Bebidas"),
    "Detalhes": const DetailsPage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu do Restaurante',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
      child: GridView.count(
        shrinkWrap: true,
          crossAxisCount: 2,
          children: [
            /*
            buildMenuItem(context, "Entradas", Icons.food_bank),
            buildMenuItem(context, "Pratos do dia", Icons.restaurant_menu),
            buildMenuItem(context, "Outros pratos", Icons.fastfood),
            buildMenuItem(context, "Bebidas", Icons.local_drink),
            buildMenuItem(context, "Sobremesas", Icons.cake),
            buildMenuItem(context, "Acompanhamentos", Icons.local_dining),
            */
            buildMenuItem(context, "Pratos", Icons.food_bank),
            buildMenuItem(context, "Mesas", Icons.event),
            buildMenuItem(context, "Bebidas", Icons.local_drink),
            buildMenuItem(context, "Detalhes", Icons.info),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String title, IconData icon) {
     double iconSize = MediaQuery.of(context).size.width * 0.3; // Adjust the multiplier as needed

    return GestureDetector(
      onTap: () {
        // Navigate to a new page here
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => menuRoutes[title]!),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
           
          ],
        ),
      ),
    );
  }
}


