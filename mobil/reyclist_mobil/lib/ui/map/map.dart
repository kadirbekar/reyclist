import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class mapPage extends StatefulWidget {
  const mapPage({Key? key}) : super(key: key);

  @override
  _mapPageState createState() => _mapPageState();
}

class _mapPageState extends State<mapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _center),
            onTap: (position) {
              _showInformationCard(context);
            },
          ),
        ],
      )),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60.0,
        items: <Icon>[
          Icon(Icons.home, size: 30),
          Icon(Icons.map, size: 30),
          Icon(Icons.qr_code, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.orange,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
      ),
    );
  }

  Future<dynamic> _showInformationCard(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.replay_circle_filled),
                title: new Text('Etimesut Geri Dönüşüm Tesisi'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const ListTile(
                leading: Text("Plastic"),
              ),
              ListTile(
                leading: const Text("Glass"),
              ),
              ListTile(
                leading: const Text("Paper"),
              ),
            ],
          );
        });
  }
}



/*Positioned(
            child: Row(
              children: [
                Expanded(child: Icon(Icons.replay_circle_filled)),
                Expanded(
                  child: Text(
                    "Etimesgut Geri Dönüşüm Tesisi",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 700,
            child: Row(
              children: [
                Container(
                    child: Text("Plastic"),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    )),
                Container(
                    child: Text("Plastic"),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ))
              ],
            ),
          )*/