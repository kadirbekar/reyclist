import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:reyclist_mobil/ansayfa.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String image = "assets/images/splash.png";
  @override
  void initState() {
    super.initState();
    _navigateToLoginView();
  }

  _navigateToLoginView() async {
    await Future.delayed(const Duration(milliseconds: 5500), () {
      context.navigateToPage(const Anasayfa());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          // const Center(
          //   child: CircularProgressIndicator(
          //     backgroundColor: Colors.amber,
          //   ),
          // ),
        ],
      ),
    );
  }
}
