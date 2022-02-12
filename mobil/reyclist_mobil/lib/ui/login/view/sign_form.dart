import 'package:flutter/material.dart';
import 'package:reyclist_mobil/core/constants/icon_constants.dart';
import 'package:reyclist_mobil/core/mixin/form_validation_mixin.dart';
import 'package:reyclist_mobil/core/widgets/button/box_button.dart';
import 'package:reyclist_mobil/core/widgets/inputs/form_input.dart';
import 'package:kartal/kartal.dart';
import 'package:reyclist_mobil/ui/forgot_password/forgot_password_view.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> with FormValidationMixin {
  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  bool remember = false;

  late final TextEditingController? _emailController;
  late final TextEditingController? _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  void _obSecureUpdate() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _emailFormField(_emailController),
            const SizedBox(height: 30),
            _passwordFormField(
              passwordController: _passwordController,
              isObSecure: _isObscure,
              obscureTap: _obSecureUpdate,
            ),
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

  Widget _passwordFormField({
    required TextEditingController? passwordController,
    required bool isObSecure,
    required void Function()? obscureTap,
  }) {
    return BoxInputField(
      controller: _passwordController,
      password: isObSecure,
      validator: (value) => checkPassword(value),
    );
    // TextFormField(

    // decoration: InputDecoration(
    //   prefixIcon: const Icon(Icons.lock),
    //   labelText: 'Şifre',
    //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
    //   suffixIcon: IconButton(icon: Icon(isObSecure ? Icons.visibility : Icons.visibility_off), onPressed: obscureTap),
    // ),
    // );
  }

  TextFormField _emailFormField(TextEditingController? email) {
    return TextFormField(
      controller: email,
      validator: (value) => checkEmail(value),
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
        onTap: () => context.navigateToPage(const ForgotPasswordView()),
        child: const Text(
          "Şifremi Unuttum",
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      );
}
