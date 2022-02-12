import 'package:flutter/material.dart';

import '../../../core/init/design/constanst.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passworConformController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _surnameController = TextEditingController();

  final TextEditingController _mailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  bool _remember = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _emailFormField(_emailController),
          SizedBox(height: 8),
          _passwordFormField(_passwordController, _isObscure, obscureTap: (() {
            setState(() {
              _isObscure = !_isObscure;
            });
          })),
        ],
      ),
    );
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

  // Widget get _rememberMe => Checkbox(
  //       value: remember,
  //       activeColor: Colors.black,
  //       onChanged: (value) {
  //         setState(() {
  //           remember = value ?? false;
  //         });
  //       },
  //     );
}
