import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/init/local_storage/shared_storage_service.dart';
import '../../core/init/network/network_service.dart';
import '../login/view/login_view.dart';

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
    _initializeServices().whenComplete(() {
      _navigateToLoginView();
    });
  }

  Future<void> _initializeServices() async {
    NetworkSettings.instance.initializeNetworkSettings();
    await SharedStorageService.instance.initializeSharedPreferences();
  }

  _navigateToLoginView() async {
    await Future.delayed(const Duration(milliseconds: 5500), () {
      context.navigateToPage(const LoginView());
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
