import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
      body: Container(
        child: Column(
          children: [
            Container(
              child: Row(children: [
                Expanded(
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://s3-ap-southeast-1.amazonaws.com/blog-sg/wp-content/uploads/2016/09/29153513/Business-lady-small.jpg"),
                      radius: 50,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Evin Gülcan",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text(
                          "Level-3   -   1330",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blueGrey),
                        child: Text(
                          "Geri Dönüşüm Geçmişim",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          debugPrint("Butona tıklandı");
                        },
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 10),
              child: Row(
                children: [
                  Text(
                    "Coupons",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Card(
                        margin: EdgeInsets.only(right: 10.0),
                        elevation: 5,
                        color: Colors.orangeAccent,
                        child: Container(
                          child: Center(
                              child: Text(
                            "örnek",
                            style:
                                TextStyle(color: Colors.white, fontSize: 36.0),
                          )),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    "Academy",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Card(
                          elevation: 5,
                          color: Colors.green,
                          child: Container(
                            child: Center(
                                child: Text(
                              "örnek",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 36.0),
                            )),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
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
}