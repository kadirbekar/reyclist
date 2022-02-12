import 'package:flutter/material.dart';
import 'package:reyclist_mobil/core/init/design/color.dart';
import 'package:reyclist_mobil/core/init/design/text_style.dart';

import '../../../core/widgets/logo/logo.dart';
import 'sign_form.dart';
import 'no_account_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
                child: Column(children: const [
              Logo(),
              SizedBox(height: 20),
              Text(
                'Recylist',
                style: headlineStyle,
              ),
              SizedBox(height: 8),
              SignForm(),
              SizedBox(height: 20),
              NoAccountText(),
            ])),
          ),
        ),
      ),
    );
  }
}
