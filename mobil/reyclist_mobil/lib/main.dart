import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'package:reyclist_mobil/ui/login/login_view_model/login_view_model.dart';
=======
>>>>>>> main
import 'package:reyclist_mobil/ui/splash/splash_view.dart';

void main() => runApp(const Reyclist());

class Reyclist extends StatelessWidget {
  const Reyclist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Reyclist',
        home: SplashView()
      ),
=======
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reyclist',
      home: SplashView(),
>>>>>>> main
    );
  }
}
