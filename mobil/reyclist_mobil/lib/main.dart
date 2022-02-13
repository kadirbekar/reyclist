import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reyclist_mobil/product/color/app_colors.dart';
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
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: AppColor.appThemeColor
        ),
        title: 'Reyclist',
        home: const SplashView()
      ),
    );
  }
}
