import 'package:flutter/material.dart';
import 'package:tastybite/home_screens/menus/infoitem_page.dart';

// Definição de um modelo para os itens (pratos ou bebidas)
class MenuItem {
  final String name;
  final String description;
  final String ingredients;
  final double rating;
  final String cookTime;
  final bool newitem;
  final String qtd;
  final String price;
  final String allergens;
  final String nutrition;
  final String image;

  MenuItem({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.rating,
    required this.cookTime,
    this.newitem = false,
    this.qtd = "",
    this.price = "",
    this.allergens = "",
    this.nutrition = "",
    this.image = "",
  });
}

class MenuItemPage extends StatelessWidget {
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
      nutrition: "Calorias: 300kcal, Proteínas: 25g, Carboidratos: 30g, Gorduras: 10g",
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
      nutrition: "Calorias: 350kcal, Proteínas: 30g, Carboidratos: 35g, Gorduras: 15g",
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
      nutrition: "Calorias: 250kcal, Proteínas: 20g, Carboidratos: 25g, Gorduras: 10g",
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
      nutrition: "Calorias: 200kcal, Proteínas: 15g, Carboidratos: 20g, Gorduras: 5g",
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
      nutrition: "Calorias: 400kcal, Proteínas: 30g, Carboidratos: 40g, Gorduras: 20g",
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
      nutrition: "Calorias: 350kcal, Proteínas: 25g, Carboidratos: 35g, Gorduras: 15g",
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
      nutrition: "Calorias: 100kcal, Proteínas: 0g, Carboidratos: 25g, Gorduras: 0g",
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
      nutrition: "Calorias: 150kcal, Proteínas: 1g, Carboidratos: 30g, Gorduras: 0g",
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
      nutrition: "Calorias: 0kcal, Proteínas: 0g, Carboidratos: 0g, Gorduras: 0g",
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
      nutrition: "Calorias: 150kcal, Proteínas: 1g, Carboidratos: 15g, Gorduras: 0g",
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
      nutrition: "Calorias: 200kcal, Proteínas: 1g, Carboidratos: 20g, Gorduras: 0g",
      image: 'assets/vinhotinto.jpg',
    ),
  ];

  const MenuItemPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: title == "Pratos" ? itemsPratos.length : itemsBebidas.length,
          itemBuilder: (context, index) {
            final item = title == "Pratos" ? itemsPratos[index] : itemsBebidas[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Hero(
                tag: "item_${item.name}",
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoPage(item: item, title: title)),
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
          },
        ),
      ),
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
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
                          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
                      textAlign: TextAlign.center, // Centraliza o texto horizontalmente
                      overflow: TextOverflow.visible, // Define o comportamento de overflow do texto
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
        mainAxisAlignment: MainAxisAlignment.center, // Alterado para MainAxisAlignment.center
        children: <Widget>[
          const SizedBox(
            width: 10,
          ),

          showrating(item.rating),

          const SizedBox(
            width: 10,
          ),

          Icon(
            title == "Bebidas" ? Icons.local_drink : Icons.timer,
            size: 17,
            color: Colors.blue,
          ),
          Text(
            title == "Bebidas" ? item.qtd : item.cookTime,
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

      const Row(
        mainAxisAlignment: MainAxisAlignment.center, // Alterado para MainAxisAlignment.center
        children: <Widget>[
          Icon(
            Icons.shopping_cart,
            color: Colors.blue,
            size: 20,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Compre já!",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                ),
          ),
        ],
        
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
            item.price,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.red),
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










