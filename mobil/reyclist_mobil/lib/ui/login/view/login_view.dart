import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/widgets/logo/logo.dart';
import '../../../product/text/app_strings.dart';
import 'no_account_text.dart';
import 'sign_form.dart';

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
                child: Column(children: [
              const Logo(),
              const SizedBox(height: 10),
              Text(TextConstants.loginAppDescription,
                  style: context.textTheme.headline5?.copyWith(fontSize: 24, fontWeight: FontWeight.w600)),
              SizedBox(height: context.dynamicHeight(0.02)),
              const SignForm(),
              const NoAccountText(),
            ])),
          ),
        ),
      ),
    );
  }
}
