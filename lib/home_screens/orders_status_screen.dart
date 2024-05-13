//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tastybite/home_screens/home_screen/home_screen.dart';
import 'package:tastybite/home_screens/menus/infoitem_page.dart';
import 'package:tastybite/home_screens/menus/order_confirmation.dart';
import 'package:tastybite/home_screens/menus/payment_method.dart';
import 'package:tastybite/services/locator_service.dart';
import 'package:tastybite/home_screens/order_page.dart';
import 'package:tastybite/home_screens/rounded_container.dart';
import 'package:intl/intl.dart';
import 'package:tastybite/home_screens/menus/menuitemspage.dart';
import 'dart:async';

final FirebaseAuth _auth = locator.get();

class OrdersStatusScreen extends StatefulWidget {
  const OrdersStatusScreen({super.key});

  @override
  _OrdersStatusScreenState createState() => _OrdersStatusScreenState();
}

class _OrdersStatusScreenState extends State<OrdersStatusScreen> {
  late Timer _timer;
  late String? _currentUserName;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<dynamic> userOrdersCollection =[
    {
      'orderTime': '2022/01/01 12:00',
      'time': 30,
      'name': 'Grelhado de Frango',
      'price': '€25.00',
      'priceinitial': '€25.00',
      'image': 'assets/grelhado.jpg',
      'quantity': 1,
    },
    {
      'orderTime': '2022/01/01 12:00',
      'time': 45,
      'name': 'Grelhado de Carne',
      'price': '€60.00',
      'priceinitial': '€30.00',
      'image': 'assets/mediterraneo_crop.jpg',
      'quantity': 2,
    },

  ];

  final List<dynamic> userReservationsCollection =[
    {
      'reservationDay': '16/05/2024',
      'reservationTime': '12:00',
      'name': 'Mesa para 3 pessoas',
      'price': '€25',
    },
  ];

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
    
    // Adicione mais itens conforme necessário
  ];
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderConfirmation()), // Altera aqui santolas
          );
        },
        child: const Icon(Icons.paid,size: 30),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: userOrdersCollection.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> orderData =
                  userOrdersCollection[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPage(item: itemsPratos[index], mquantity: orderData['quantity'])),
                  );
                },
                child: ListTile(
                  subtitle: TRoundedContainer(
                    showBorder: true,
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${orderData['name']}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          
                          children: [
                            Container(
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                  image: AssetImage(orderData['image']),
                                ),
                              ),
                            ),
                            /*Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    calculateOrderStatus(
                                            orderData['orderTime'],
                                            orderData['time'])[
                                        'orderdescription'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                            color: Colors.blue,
                                            fontWeightDelta: 1),
                                  ),
                                  Text(
                                      calculateOrderStatus(
                                              orderData['orderTime'],
                                              orderData['time'])[
                                          'timestatus'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                ],
                              ),
                            ),*/
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Icons.shopping_bag),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Quantidade',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(250),
                                          ),
                                          width: 80,
                                          height: 35,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                GestureDetector(
                                                  // orderData['price'] is the price of the item
                                                  onTap: () => remove(orderData),
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ),
                                                ),
                                                Text(
                                                  '${orderData['quantity']}',
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.normal,
                                                      fontSize: 18),
                                                ),
                                                GestureDetector(
                                                  onTap: () => add(orderData),
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: Colors.green,
                                                    size: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                      
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Icons.local_offer),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Preço',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        Text(
                                            '${orderData['price']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Delete IconButton
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Remover item'),
                                      content: const Text(
                                          'Tem a certeza que deseja remover este item?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              userOrdersCollection.removeAt(index);
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Remover'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
        
                          ],
                        ),
                      ],
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
            itemCount: userReservationsCollection.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> reservationData =
                  userReservationsCollection[index];
              return GestureDetector(
                onTap: () {
                },
                child: ListTile(
                  subtitle: TRoundedContainer(
                    showBorder: true,
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${reservationData['name']}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Icons.sunny),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dia',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        Text(
                                            '${reservationData['reservationDay']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Icons.schedule),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hora',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        Text(
                                            '${reservationData['reservationTime']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Icons.local_offer),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Preço',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        Text(
                                            '${reservationData['price']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Delete IconButton
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Remover item'),
                                      content: const Text(
                                          'Tem a certeza que deseja remover este item?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              userReservationsCollection.removeAt(index);
                                            });
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Remover'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          ]
        ),
      ),
      ),
    );
  }
  // will receive orderdata
  void add( Map<String, dynamic> orderData) {
    print("-----------");
    print(orderData);
    print("-----------");
    setState(() {
      orderData['quantity'] = orderData['quantity'] + 1;
      double tempPrice = double.parse(orderData['priceinitial'].substring(1));
      print("-----------");
      print(tempPrice);
      print("-----------");
      double total = tempPrice * orderData['quantity'];
      print("-----------");
        print(total);
        print("-----------");
      orderData['price'] = '€' + total.toStringAsFixed(2);
    });
  }

  void remove(Map<String, dynamic> orderData) {
    print("-----------");
    print(orderData);
    print("-----------");
    setState(() {
      if (orderData['quantity'] > 1) {
        orderData['quantity'] = orderData['quantity'] - 1;
        double tempPrice = double.parse(orderData['priceinitial'].substring(1));
        print("-----------");
        print(tempPrice);
        print("-----------");
        double total = tempPrice * orderData['quantity'];
        print("-----------");
        print(total);
        print("-----------");
        
        orderData['price'] = '€' + total.toStringAsFixed(2);
      }
    });
  }
}


Map<String, dynamic> calculateOrderStatus(String orderTime, int estimatedTime) {
  DateTime now = DateTime.now();
  List<String> orderTimeParts = orderTime.split(' ');
  List<String> dateParts = orderTimeParts[0].split('/');
  List<String> timeParts = orderTimeParts[1].split(':');
  DateTime orderDateTime = DateTime(
    int.parse(dateParts[2]), // year
    int.parse(dateParts[1]), // month
    int.parse(dateParts[0]), // day
    int.parse(timeParts[0]), // hour
    int.parse(timeParts[1]), // minute
  );
  int elapsedMinutes = now.difference(orderDateTime).inMinutes;
  int remainingTime = estimatedTime - elapsedMinutes;

  String timestatus;
  String orderdescription;

  remainingTime = estimatedTime - elapsedMinutes;

  if (remainingTime <= 0) {
    timestatus = 'Expirado';
    orderdescription = 'Expirado';
  } else if (remainingTime <= 5) {
    timestatus = '1-5 min';
    orderdescription = 'Quase lá';
  } else if (remainingTime <= 10) {
    timestatus = '6-10 min';
    orderdescription = 'A caminho';
  } else if (remainingTime <= 15) {
    timestatus = '11-15 min';
    orderdescription = 'A caminho';
  } else if (remainingTime <= 19) {
    timestatus = '16-19 min';
    orderdescription = 'Processando';
  } else {
    timestatus = '$remainingTime min';
    orderdescription = 'Processando';
  }

  return {
    'timestatus': timestatus,
    'orderdescription': orderdescription,
    'remainingTime': remainingTime,
  };
}


