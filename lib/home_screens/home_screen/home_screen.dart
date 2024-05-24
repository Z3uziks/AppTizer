import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:tastybite/home_screens/restaurant_menu.dart';
import 'package:provider/provider.dart';
import 'package:tastybite/services/locator_service.dart';
import 'package:tastybite/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tastybite/util/logout.dart';

final FirebaseAuth _auth = locator.get();
final FirebaseFirestore _firestore = locator.get();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    bool isDark = false;
    final List<String> suggestions = [
      'Ramona',
      'Dolce Pizzeria Ristorante',
    ];
    LogoutHelper logoutHelper = Provider.of<LogoutHelper>(context);

    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(40.6412, -8.65362),
              zoom: 15.2,
              interactiveFlags: ~InteractiveFlag.pinchZoom |
                  ~InteractiveFlag
                      .doubleTapZoom, // Disable pinch and double-tap zoom
              
            ),

            children: [

              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              
              MarkerLayer(
                
                markers: [
                  Marker(
                    width: 380,
                    point: LatLng(40.638436419064966, -8.65123786779018),
                    anchorPos: AnchorPos.align(AnchorAlign.center),
                    builder: (context) => const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.red,
                        ),
                        SizedBox(width: 4),
                        Text("Ramona",
                            style: TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  Marker(
                      width: 380,
                      point: LatLng(40.643165819665114, -8.645309499553468),
                      builder: (context) => const Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 30,
                                color: Colors.red,
                              ),
                              SizedBox(width: 4),
                              Text("Dolce Pizzeria Ristorante",
                                  style: TextStyle(fontSize: 15),
                                  overflow: TextOverflow.ellipsis),
                            ],
                          )),
                ],
              )
            ],
          ),
          
          Positioned(
             top: 5, left: 0, right: 0,
             child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
            );
          }, suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(suggestions.length, (int index) {
              final String item = suggestions[index];
              return ListTile(
                leading: Icon(Icons.location_on),
                title: Text(item),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RestaurantMenu()),
                  );
                },
              );
            });
          }),),
          
        ],

      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showLogoutConfirmationDialog(context, logoutHelper),
        child: Icon(
          Icons.logout,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),


    );
  }
  void _showLogoutConfirmationDialog(BuildContext context, LogoutHelper logoutHelper) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                  await AuthServices(_firestore, _auth)
                      .signOut(context, logoutHelper);
                      Navigator.of(context).pop(); // Close the dialog
                },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
