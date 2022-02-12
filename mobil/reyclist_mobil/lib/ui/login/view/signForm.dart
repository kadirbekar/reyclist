import 'package:flutter/material.dart';
import 'package:reyclist_mobil/core/widgets/button/box_button.dart';
import 'package:reyclist_mobil/ui/forgot_passworld/forgot_passworld_view.dart';

import '../../../core/init/design/constanst.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _emailFormField(_emailController),
            const SizedBox(height: 30),
            _passwordFormField(_passwordController, _isObscure,
                obscureTap: (() {
              setState(() {
                _isObscure = !_isObscure;
              });
            })),
            const SizedBox(height: 20),
            Row(
              children: [
                _rememberMe,
                const Text("Remember me"),
                const Spacer(),
                _forgotPass,
              ],
            ),
            BoxButton(
              title: 'Gririş Yap',
              onTap: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  print('kod çalısti');
                }
              },
            )
          ],
        ));
  }

  TextFormField _passwordFormField(
      TextEditingController passworld, bool isObSecure,
      {void Function()? obscureTap}) {
    return TextFormField(
      controller: passworld,
      validator: (value) {
        if (value!.length < 8) {
          return 'Şifreniz en az 8 karakter olmalıdır';
        } else {
          return null;
        }
      },
      obscureText: isObSecure,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          labelText: 'Şifre',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          suffixIcon: IconButton(
              icon: Icon(isObSecure ? Icons.visibility : Icons.visibility_off),
              onPressed: obscureTap)),
    );
  }

  TextFormField _emailFormField(TextEditingController email) {
    return TextFormField(
      controller: email,
      validator: (value) {
        if (emailValidatorRegExp.hasMatch(value ?? '')) {
          return null;
        } else {
          return 'E-postanız yada doğru doldurulmalıdır.';
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        labelText: 'E-posta',
        //hintText: 'E-posta ',
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }

  Widget get _rememberMe => Checkbox(
        value: remember,
        activeColor: Colors.black,
        onChanged: (value) {
          setState(() {
            remember = value ?? false;
          });
        },
      );

  Widget get _forgotPass => GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ForgotPasswordView())),
        //Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
        child: const Text(
          "Şifremi Unuttum",
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      );
}
