import 'package:flutter/material.dart';
import 'package:reyclist_mobil/core/constants/icon_constants.dart';
import 'package:reyclist_mobil/core/constants/regex_constants.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController? _emailController;
  late final TextEditingController? _passwordController;
  late final TextEditingController? _nameController;
  late final TextEditingController? _surnameController;
  late final TextEditingController? _mailController;
  late final TextEditingController? _phoneController;

  bool _remember = false;
  bool _isObscure = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController?.dispose();
    _passwordController?.dispose();
    _nameController?.dispose();
    _surnameController?.dispose();
    _emailController?.dispose();
    _phoneController?.dispose();
    super.dispose();
  }

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

  TextFormField _passwordFormField(TextEditingController? passworld, bool isObSecure, {void Function()? obscureTap}) {
    return TextFormField(
      controller: passworld,
      validator: (value) {
        //  TODO: Form mixin içerisinden bu method çağrılabilir.
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
          //  TODO: buradaki iconlar icon constant içerisine tanımlanabilir.
          suffixIcon:
              IconButton(icon: Icon(isObSecure ? Icons.visibility : Icons.visibility_off), onPressed: obscureTap)),
    );
  }

  TextFormField _emailFormField(TextEditingController? email) {
    //  TODO: box input field kullanılabilir.
    return TextFormField(
      controller: email,
      validator: (value) {
        //  form mixin içerisinden checkEmail metodu çağrılabilir.
        if (RegexConstants.instance.emailValidatorRegExp.hasMatch(value ?? '')) {
          return null;
        } else {
          return 'E-postanız yada doğru doldurulmalıdır.';
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: IconConstants.email,
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
