import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:reyclist_mobil/core/constants/image_constant.dart';
import 'package:reyclist_mobil/direction_page.dart';
import 'package:reyclist_mobil/core/init/local_storage/shared_storage_service.dart';
import 'package:reyclist_mobil/core/init/network/network_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
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
      context.navigateToPage(const DirectionPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            ImageConstant.imagePath,
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
