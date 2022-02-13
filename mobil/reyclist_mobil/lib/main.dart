import 'package:flutter/material.dart';

import 'ui/forgot_password/forgot_password_view.dart';

void main() => runApp(const Reyclist());

class Reyclist extends StatelessWidget {
  const Reyclist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reyclist',
      home: ForgotPasswordView(),
    );
  }
}
