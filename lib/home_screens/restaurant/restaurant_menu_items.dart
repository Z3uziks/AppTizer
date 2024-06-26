import 'package:flutter/material.dart';
//import 'package:tastybite/home_screens/menus/infoitem_page.dart';
import 'package:tastybite/home_screens/restaurant/restaurant_item_info.dart';
import 'package:tastybite/home_screens/restaurant/restaurant_newitem_info.dart';
import 'package:tastybite/home_screens/menus/menuitemspage.dart';
import 'package:tastybite/home_screens/restaurant/add_item.dart'; // go get the class MenuItem

class RestaurantMenuItems extends StatefulWidget {
  final String title;

  // Lista de pratos ou bebidas
  static final List<MenuItem> itemsPratos = [
    MenuItem(
      name: 'Grelhado de Frango',
      description: 'Peito de frango grelhado com salada e arroz.',
      ingredients: 'Peito de frango, alface, tomate, arroz',
      rating: 4.5,
      cookTime: "30m",
      newitem: true,
      price: "€25.00",
      allergens: "Glúten, Lactose",
      nutrition:
          "Calorias: 300kcal, Proteínas: 25g, Carboidratos: 30g, Gorduras: 10g",
      image: 'assets/grelhado.jpg',
    ),
    MenuItem(
      name: 'Grelhado de Carne',
      description: 'Carne grelhada com salada e batata frita.',
      ingredients: 'Carne, alface, tomate, batata',
      rating: 5,
      cookTime: "45m",
      newitem: false,
      price: "€30.00",
      allergens: "Glúten, Lactose",
      nutrition:
          "Calorias: 350kcal, Proteínas: 30g, Carboidratos: 35g, Gorduras: 15g",
      image: 'assets/mediterraneo_crop.jpg',
    ),
    MenuItem(
      name: 'Grelhado de Peixe',
      description: 'Peixe grelhado com salada e batata cozida.',
      ingredients: 'Peixe, alface, tomate, batata',
      rating: 4.0,
      cookTime: "40m",
      newitem: false,
      price: "€20.00",
      allergens: "Glúten, Lactose",
      nutrition:
          "Calorias: 250kcal, Proteínas: 20g, Carboidratos: 25g, Gorduras: 10g",
      image: 'assets/peixe.jpg',
    ),
    MenuItem(
      name: 'Grelhado de Vegetais',
      description: 'Vegetais grelhados com salada e arroz.',
      ingredients: 'Vegetais, alface, tomate, arroz',
      rating: 2,
      cookTime: "30m",
      newitem: true,
      price: "€15.00",
      allergens: "Glúten, Lactose",
      nutrition:
          "Calorias: 200kcal, Proteínas: 15g, Carboidratos: 20g, Gorduras: 5g",
      image: 'assets/vegetais.jpg',
    ),
    MenuItem(
      name: 'Francesinha',
      description: 'Francesinha com batata frita.',
      ingredients: 'Pão, salsicha, bife, queijo, molho',
      rating: 3,
      cookTime: "45m",
      newitem: false,
      price: "€10.00",
      allergens: "Glúten, Lactose",
      nutrition:
          "Calorias: 400kcal, Proteínas: 30g, Carboidratos: 40g, Gorduras: 20g",
      image: 'assets/francesinha.jpg',
    ),
    MenuItem(
      name: 'Lasanha',
      description: 'Lasanha de carne com molho de tomate.',
      ingredients: 'Massa, carne, queijo, molho',
      rating: 5.0,
      cookTime: "40m",
      newitem: false,
      price: "€12.00",
      allergens: "Glúten, Lactose",
      nutrition:
          "Calorias: 350kcal, Proteínas: 25g, Carboidratos: 35g, Gorduras: 15g",
      image: 'assets/lasanha.jpg',
    )
  ];

  static final List<MenuItem> itemsBebidas = [
    MenuItem(
      name: 'Coca-Cola',
      description: 'Cola-Cola gelada.',
      ingredients: 'Água, açúcar, corante',
      rating: 4.5,
      cookTime: "30m",
      qtd: "100ml",
      newitem: true,
      price: "€2.00",
      allergens: "Glúten, Lactose",
      nutrition:
          "Calorias: 100kcal, Proteínas: 0g, Carboidratos: 25g, Gorduras: 0g",
      image: 'assets/cocacola.jpeg',
    ),
    MenuItem(
      name: 'Sumo de Laranja',
      description: 'Sumo de laranja natural.',
      ingredients: 'Laranja, água, açúcar',
      rating: 4.2,
      cookTime: "45m",
      qtd: "200ml",
      newitem: false,
      price: "€2.90",
      allergens: "Glúten, Lactose",
      nutrition:
          "Calorias: 150kcal, Proteínas: 1g, Carboidratos: 30g, Gorduras: 0g",
      image: 'assets/sumolaranja.jpeg',
    ),
    MenuItem(
      name: 'Água',
      description: 'Água mineral.',
      ingredients: 'Água',
      rating: 5,
      cookTime: "40m",
      qtd: "500ml",
      newitem: false,
      price: "€1.00",
      allergens: "Glúten, Lactose",
      nutrition:
          "Calorias: 0kcal, Proteínas: 0g, Carboidratos: 0g, Gorduras: 0g",
      image: 'assets/agua.jpg',
    ),
    MenuItem(
      name: 'Cerveja',
      description: 'Cerveja gelada.',
      ingredients: 'Água, cevada, lúpulo',
      rating: 4.0,
      cookTime: "30m",
      qtd: "330ml",
      newitem: true,
      price: "€2.50",
      allergens: "Glúten, Lactose",
      nutrition:
          "Calorias: 150kcal, Proteínas: 1g, Carboidratos: 15g, Gorduras: 0g",
      image: 'assets/cerveja.jpg',
    ),
    MenuItem(
      name: 'Vinho Tinto',
      description: 'Vinho tinto de qualidade.',
      ingredients: 'Uvas, água, açúcar',
      rating: 3.5,
      cookTime: "45m",
      qtd: "750ml",
      newitem: false,
      price: "€15.00",
      allergens: "Glúten, Lactose",
      nutrition:
          "Calorias: 200kcal, Proteínas: 1g, Carboidratos: 20g, Gorduras: 0g",
      image: 'assets/vinhotinto.jpg',
    ),
  ];
  static final List<NewMenuItem> newItems = [];

  const RestaurantMenuItems({super.key, required this.title});

  @override
  State<RestaurantMenuItems> createState() => _RestaurantMenuItemsState();
}

class _RestaurantMenuItemsState extends State<RestaurantMenuItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to AddDishPage and wait for a result
          final newDish = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItem()),
          );
          // Check if a new dish was added
          if (newDish != null) {
            // Add the new dish to the menu
            // For example, you can add it to the itemsPratos list
            setState(() {
              RestaurantMenuItems.newItems.add(newDish);
            });
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: [
            // for new items
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: RestaurantMenuItems.newItems.length,
            itemBuilder: (context, index) {
              final item = RestaurantMenuItems.newItems[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Hero(
                  tag: "item_${item.name}",
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RestaurantNewItemInfo(item: item)),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 150,
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: item.image != null
                            ? Image.file(
                                item.image!,
                                width: 230,
                                height: 210,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                item.imageurl,
                                width: 230,
                                height: 210,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: buildNewItemDetails(item),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
            // show the table reservation
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.title == "Pratos" ? RestaurantMenuItems.itemsPratos.length + 1 : RestaurantMenuItems.itemsBebidas.length + 1,
            itemBuilder: (context, index) {
              if (index ==
                  (widget.title == "Pratos"
                      ? RestaurantMenuItems.itemsPratos.length
                      : RestaurantMenuItems.itemsBebidas.length)) {
                return GestureDetector(
                  onTap: () async {
                    // Navigate to AddDishPage and wait for a result
                    final newDish = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddItem()),
                    );

                    // Check if a new dish was added
                    if (newDish != null) {
                      // Add the new dish to the menu
                      // For example, you can add it to the itemsPratos list
                      setState(() {
                        RestaurantMenuItems.newItems.add(newDish);
                      });
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child:  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add,
                            size: 30.0,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                              width: 10.0), // Add spacing between icon and text
                          Text(
                            widget.title == "Pratos" ? "Adicionar prato" : "Adicionar bebida",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                final item =
                    widget.title == "Pratos" ? RestaurantMenuItems.itemsPratos[index] : RestaurantMenuItems.itemsBebidas[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Hero(
                    tag: "item_${item.name}",
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RestaurantItemInfo(item: item)),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 5,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 150,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topRight,
                                  image: AssetImage(item.image),
                                ),
                              ),
                            ),
                            Expanded(
                              child: buildItemDetails(item),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
          


          ],
        ),
      ),
      ),
    );
  }

  Widget buildNewItemDetails(NewMenuItem item) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    Visibility(
                      visible: item.newitem,
                      child: Container(
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Novo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        item.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue),
                        textAlign: TextAlign
                            .center, // Centraliza o texto horizontalmente
                        overflow: TextOverflow
                            .visible, // Define o comportamento de overflow do texto
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment
              .center, // Alterado para MainAxisAlignment.center
          children: <Widget>[
            const SizedBox(
              width: 10,
            ),
            showrating(item.rating),
            const SizedBox(
              width: 10,
            ),
            Icon(
              widget.title == "Bebidas" ? Icons.local_drink : Icons.timer,
              size: 17,
              color: Colors.blue,
            ),
            Text(
              widget.title == "Bebidas" ? item.qtd : item.cookTime,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        
        Text(
          item.price,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.red),
        ),
      ],
    );
  }


  Widget buildItemDetails(MenuItem item) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    Visibility(
                      visible: item.newitem,
                      child: Container(
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Novo",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        item.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue),
                        textAlign: TextAlign
                            .center, // Centraliza o texto horizontalmente
                        overflow: TextOverflow
                            .visible, // Define o comportamento de overflow do texto
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment
              .center, // Alterado para MainAxisAlignment.center
          children: <Widget>[
            const SizedBox(
              width: 10,
            ),
            showrating(item.rating),
            const SizedBox(
              width: 10,
            ),
            Icon(
              widget.title == "Bebidas" ? Icons.local_drink : Icons.timer,
              size: 17,
              color: Colors.blue,
            ),
            Text(
              widget.title == "Bebidas" ? item.qtd : item.cookTime,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        
        Text(
          item.price,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.red),
        ),
      ],
    );
  }

  void _showItemDetails(BuildContext context, MenuItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(item.name),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Descrição: ${item.description}'),
                Text('Ingredientes: ${item.ingredients}'),
                Text('Rating: ${item.rating.toString()}'),
                Text('Tempo de preparo: ${item.cookTime.toString()} minutos'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}

Widget showrating(double rating) {
  return Row(
    children: <Widget>[
      Icon(
        Icons.star,
        size: 17,
        color: rating >= 1 ? Colors.orangeAccent : Colors.grey,
      ),
      Icon(
        Icons.star,
        size: 17,
        color: rating >= 2 ? Colors.orangeAccent : Colors.grey,
      ),
      Icon(
        Icons.star,
        size: 17,
        color: rating >= 3 ? Colors.orangeAccent : Colors.grey,
      ),
      Icon(
        Icons.star,
        size: 17,
        color: rating >= 4 ? Colors.orangeAccent : Colors.grey,
      ),
      Icon(
        Icons.star,
        size: 17,
        color: rating == 5 ? Colors.orangeAccent : Colors.grey,
      ),
    ],
  );
}
