import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reyclist_mobil/ui/login/login_view_model/login_view_model.dart';
import 'package:reyclist_mobil/ui/splash/splash_view.dart';

void main() => runApp(const Reyclist());

class Reyclist extends StatelessWidget {
  const Reyclist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserContext())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Reyclist',
        home: SplashView()
      ),
    );
  }
}
