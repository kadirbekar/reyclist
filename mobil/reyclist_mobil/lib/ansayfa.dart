import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:reyclist_mobil/ui/QR/qr.dart';
import 'package:reyclist_mobil/ui/home/home.dart';
import 'package:reyclist_mobil/ui/map/map.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _aktifNo = 0;
  late PageController sayfaKumandasi;

  @override
  void initState() {
    super.initState();
    sayfaKumandasi = PageController();
  }

  @override
  void dispose() {
    sayfaKumandasi.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (acilanSayfaNo) {
          setState(() {
            _aktifNo = acilanSayfaNo;
          });
        },
        controller: sayfaKumandasi,
        children: const [
          HomePage(),
          MapPage(),
          qrScanPage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60.0,
        items: const <Icon>[
          Icon(Icons.home, size: 30),
          Icon(Icons.map, size: 30),
          Icon(Icons.qr_code, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.green.shade300,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (selectPage) {
          setState(() {
            sayfaKumandasi.jumpToPage(selectPage);
          });
        },
      ),
    );
  }
}
