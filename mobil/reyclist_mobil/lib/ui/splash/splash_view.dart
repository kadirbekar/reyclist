import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:reyclist_mobil/ui/login/login_view_model/login_view_model.dart';
import 'package:reyclist_mobil/ui/login/model/user_response_model.dart';

import '../../ansayfa.dart';
import '../../core/constants/padding_constants.dart';
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
    _initializeServices();
  }

  Future<void> _initializeServices() async {
    await SharedStorageService.instance.initializeSharedPreferences();
    NetworkSettings.instance.initializeNetworkSettings();
    await _checkUserLoginStatus();
  }

  Future<void> _checkUserLoginStatus() async {
    if (await SharedStorageService.instance.readBoolValue(SharedEnum.login.name)) {
      context.read<UserContext>().setUserDataFromLocalStorage(SharedStorageService.instance.readModel<UserResponseModel>(SharedEnum.user.name));
      _navigateToPage(const MainPage());
    } else {
      _navigateToPage(const LoginView());
    }
  }

  _navigateToPage(Widget page) => context.navigateToPage(page);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.loose,
          children: [
            _splashImage(),
            _circularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Image _splashImage() {
    return Image.asset(
      image,
      fit: BoxFit.fitWidth,
      width: double.infinity,
    );
  }

  Positioned _circularProgressIndicator() {
    return Positioned(
      child: Padding(
        padding: PagePadding.all(),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
