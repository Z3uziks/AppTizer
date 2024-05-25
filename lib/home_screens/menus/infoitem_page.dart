import 'package:flutter/material.dart';
import 'package:tastybite/home_screens/menus/menuitemspage.dart';
import 'package:tastybite/home_screens/orders_status_screen.dart';

class InfoPage extends StatefulWidget {
  final MenuItem item;
  final int mquantity;
  final String title;
  // quantity is not mandatory

  const InfoPage({Key? key, required this.item, this.mquantity = 0, this.title = 'Pratos'}): super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  
  int quantity = 1;
  double total = 0;
  int added = 0;

  @override
  void initState() {
    super.initState();
    if (widget.mquantity > 0) {
      quantity = widget.mquantity;
    }
    total = adjustprice(widget.item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // icon of Carrinho to redirect to the cart
      appBar: AppBar(
        title: const Text("Informações do Produto"),
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          Text(
            "$added",
            style: const TextStyle(fontSize: 20),
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrdersStatusScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: const Alignment(0.8, 0.0),
                        colors: [
                          Colors.lightBlue,
                          Colors.lightBlueAccent[100]!,
                        ],
                        tileMode: TileMode.repeated,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                widget.item.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              IconButton(
                                padding: EdgeInsets.zero, // Adicionando padding zero
                                onPressed: () {
                                  _showInfoDialog(context, widget.item);
                                },
                                icon: const Icon(
                                  Icons.info,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        itemCake(widget.item),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ((MediaQuery.of(context).size.width - 175) / 2),
                      top: (MediaQuery.of(context).size.height + 175) / 5),
                  child: Hero(
                    tag: "cakeitem",
                    child: ClipOval(
                      child: Image.asset(
                        widget.item.image,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Quantidade",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 25),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(250),
                        ),
                        width: 100,
                        height: 35,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => remove(widget.item.price),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                '$quantity',
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              ),
                              GestureDetector(
                                onTap: () => add(widget.item.price),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Total amount"),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("€$total"),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue[400]!),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Adicionar ao Carrinho",
                            style: TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                          // alert dialog
                          onPressed: () {
                            setState(() {
                              added = added + 1;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                // if title Pratos, redirect to MenuItemPage(title: 'Pratos') else redirect to MenuItemPage(title: 'Bebidas')
                                  builder: (context) => MenuItemPage(title: widget.title))
                            );
                            showDialog(
                              context: context,
                              barrierDismissible: false, // Impede que o utilizador feche o diálogo clicando fora dele
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Produto Adicionado"),
                                  content: const Text(
                                      "O produto foi adicionado ao carrinho com sucesso!"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Fechar"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void add(String itemPrice) {
    setState(() {
      quantity = quantity + 1;
      itemPrice = itemPrice.substring(1);
      double tempPrice = double.parse(itemPrice);
      total = tempPrice * quantity;
    });
  }

  void remove(String itemPrice) {
    setState(() {
      if (quantity > 1) {
        quantity = quantity - 1;
        itemPrice = itemPrice.substring(1);
        double tempPrice = double.parse(itemPrice);
        total = tempPrice * quantity;
      }
    });
  }

  double adjustprice(String itemPrice) {
    // itemPrice = "€25.00"
    itemPrice = itemPrice.substring(1);
    return double.parse(itemPrice) * quantity;
  }

  void _showInfoDialog(BuildContext context, MenuItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Informações Adicionais"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildInfoRow("Alergénicos", item.allergens),
              const SizedBox(height: 10),
              _buildInfoRow("Nutrição", item.nutrition),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Fechar"),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(String title, String info) {
    info == "" ? info = "No information" : info = info;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(info),
      ],
    );
  }

}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 1.3);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 1.3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

Widget itemCake(MenuItem item) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 15,
        ),
        Text(
          item.description,
          style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: Colors.white),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            showrating(item.rating),
            Column(
              children: <Widget>[
                Text(
                  item.price,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black54),
                ),
                const Text(
                  "por Quantidade",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10,
                      color: Colors.black),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            const SizedBox(
              width: 5,
            ),
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
          ],
        ),
      ],
    ),
  );
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
