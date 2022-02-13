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
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
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
                const Expanded(
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
                      const Text(
                        "Evin Gülcan",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: const Text(
                          "Level-3   -   1330",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.blueGrey),
                        child: const Text(
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
                children: const [
                  Text(
                    "Coupons",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Card(
                        margin: const EdgeInsets.only(right: 10.0),
                        elevation: 5,
                        color: Colors.orangeAccent,
                        child: Container(
                          child: const Center(
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
                children: const [
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Card(
                          elevation: 5,
                          color: Colors.green,
                          child: Container(
                            child: const Center(
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
        items: const [
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
