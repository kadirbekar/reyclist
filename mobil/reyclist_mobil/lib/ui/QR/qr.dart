import 'package:flutter/material.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({Key? key}) : super(key: key);

  @override
  _QrScanPageState createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Scan QR Code",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 300,
              child: Image.network("https://i.pinimg.com/originals/9d/8e/04/9d8e04771acbce143bc9ee2737239404.png"),
            )
          ],
        ),
      ),
    );
  }
}
