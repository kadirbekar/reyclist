import 'package:flutter/material.dart';

class qrScanPage extends StatefulWidget {
  const qrScanPage({Key? key}) : super(key: key);

  @override
  _qrScanPageState createState() => _qrScanPageState();
}

class _qrScanPageState extends State<qrScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                    ))
              ],
            ),
            Text(
              "Scan QR Code",
              style: TextStyle(fontSize: 40),
            ),
            Container(
              height: 300,
              child: Image.network(
                  "https://i.pinimg.com/originals/9d/8e/04/9d8e04771acbce143bc9ee2737239404.png"),
            )
          ],
        ),
      ),
    );
  }
}
