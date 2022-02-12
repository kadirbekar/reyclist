import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      /*body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: numbers.length, itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Card(
                  color: Colors.blue,
                  child: Container(
                    child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
                  ),
                ),
              );
        }),
      ),*/
    );
  }
}
