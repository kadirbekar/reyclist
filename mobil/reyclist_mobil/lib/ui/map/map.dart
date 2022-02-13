import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reyclist_mobil/core/widgets/button/box_button.dart';
import 'package:reyclist_mobil/core/widgets/text/box_text.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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
            initialCameraPosition: CameraPosition(target: _center, zoom: 12.0),
            onTap: (position) {
              _showInformationCard(context);
            },
          ),
        ],
      )),
    );
  }

  Future<dynamic> _showInformationCard(BuildContext context) {
    return showModalBottomSheet(
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  titleRecyclingCenter(context),
                  wastes(),
                  const SizedBox(
                    height: 5,
                  ),
                  descriptionWaste(),
                  buttonGetDirection(),
                ],
              ),
            ),
          );
        });
  }

  Expanded buttonGetDirection() {
    return Expanded(
      flex: 0,
      child: InkWell(
        onTap: () {},
        child: const BoxButton(
          title: "Get Direction",
        ),
      ),
    );
  }

  Expanded descriptionWaste() {
    return Expanded(
      flex: 2,
      child: ListView(
        children: [
          BoxText.body(
              "aplğaldeğapldogrpkerogkerogpeogjeporwğkfpğwfeğwpkorgeğrgoeojaplğaldeğapldogrpkerogkerogpeogjeporwğkfpğwfeğwpkorgeğrgoeojaplğaldeğapldogrpkerogkerogpeogjeporwğkfpğwfeğwpkorgeğrgoeojaplğaldeğapldogrpkerogkerogpeogjeporwğkfpğwfeğwpkorgeğrgoeojgjeporwğkfpğwfeğwpkorgeğrgoeojaplğaldeğapldogrpkerogkerogpeogjeporwğkfpğwfeğwpkorgeğrgoeojaplğaldeğapldogrpkerogkerogpeogjeporwğkfpğwfeğwpkorgeğrgoeoj"),
        ],
      ),
    );
  }

  Padding wastes() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        flex: 1,
        child: Row(
          children: [
            recycling(
              icon: const Icon(Icons.add_to_drive_outlined),
              recyclingName: "Plastic",
              color: const Color.fromRGBO(213, 236, 249, 1),
            ),
            const SizedBox(
              width: 12,
            ),
            recycling(
              icon: const Icon(Icons.money),
              recyclingName: "Earn Money",
              color: Colors.yellow.shade300,
            ),
          ],
        ),
      ),
    );
  }

  Expanded titleRecyclingCenter(BuildContext context) {
    return Expanded(
      flex: 0,
      child: ListTile(
        leading: const Icon(Icons.replay_circle_filled),
        title: const Text('Etimesut Geri Dönüşüm Tesisi'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Container recycling(
      {required Icon icon,
      required String recyclingName,
      required Color color}) {
    return Container(
      alignment: Alignment.center,
      height: 25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(
              1.0,
              1.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: iconTextRow(icon, recyclingName),
    );
  }

  Padding iconTextRow(Icon icon, String recyclingName) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon,
          Text(recyclingName),
        ],
      ),
    );
  }
}
