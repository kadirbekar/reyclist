import 'package:flutter/material.dart';

import 'register_form.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Kayıt Ol',
          )),
      body: SafeArea(
          child: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
              child: Column(children: const [
            SizedBox(height: 8),
            RegisterForm(),
            SizedBox(height: 20),
          ])),
        ),
      )),
    );
  }
}
