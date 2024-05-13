import 'package:flutter/material.dart';
import 'package:tastybite/home_screens/menus/menuitemspage.dart';

class InfoPage extends StatefulWidget {
  final MenuItem item;

  const InfoPage({Key? key, required this.item}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int quantity = 1;
  double total = 0;

  @override
  void initState() {
    super.initState();
    total = adjustprice(widget.item.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações do Produto"),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment(0.8, 0.0),
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
                          padding: EdgeInsets.only(top: 20),
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
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
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
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => remove(widget.item.price),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                "$quantity",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              ),
                              GestureDetector(
                                onTap: () => add(widget.item.price),
                                child: Icon(
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
                  SizedBox(
                    height: 10,
                  ),
                  Text("Total amount"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("€$total"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.5,
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
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                                color: Colors.white, fontSize: 22),
                          ),
                          onPressed: () {
                            // Redirect to the cart page (not finished yet)
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
        SizedBox(
          height: 15,
        ),
        Text(
          item.description,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15,
              color: Colors.white),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            showrating(item.rating),
            Column(
              children: <Widget>[
                Text(
                  "${item.price}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black54),
                ),
                Text(
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
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            SizedBox(
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
