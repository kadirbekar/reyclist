import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:reyclist_mobil/ui/login/view/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToLoginView();
  }

  _navigateToLoginView() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {
      context.navigateToPage(const LoginView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash View"),
      ),
    );
  }
}
