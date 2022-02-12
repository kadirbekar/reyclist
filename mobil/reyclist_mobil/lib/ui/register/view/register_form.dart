import 'package:flutter/material.dart';
import 'package:reyclist_mobil/core/constants/icon_constants.dart';
import 'package:reyclist_mobil/core/constants/widget_size_constant.dart';

import 'package:reyclist_mobil/core/mixin/form_validation_mixin.dart';

import '../../../core/mixin/form_validation_mixin.dart';
import '../../../core/widgets/button/box_button.dart';
import '../../../core/widgets/circle_avatar_icon/circle_avatar_icon.dart';
import '../../../core/widgets/inputs/form_input.dart';
import '../../../core/widgets/text/have_account.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with FormValidationMixin {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController? _emailController;
  late final TextEditingController? _passwordController;
  late final TextEditingController? _nameController;
  late final TextEditingController? _surnameController;
  late final TextEditingController? _phoneController;

  bool _remember = false;
  bool _isObscure = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();

    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController?.dispose();
    _passwordController?.dispose();
    _nameController?.dispose();
    _surnameController?.dispose();

    _phoneController?.dispose();
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
          CircleAvatarIcon(),
          SizedBox(height: WidgetSizeConstant.xLarge * 2),
          _emailFormField(),
          SizedBox(height: WidgetSizeConstant.xLarge),
          _passwordFormField(
            isObSecure: _isObscure,
            obscureTap: _obSecureUpdate,
          ),
          SizedBox(height: WidgetSizeConstant.xLarge),
          _nameFormField(),
          SizedBox(height: WidgetSizeConstant.xLarge),
          surNameFormField(),
          SizedBox(height: WidgetSizeConstant.xLarge),
          phoneFormField(),
          SizedBox(height: WidgetSizeConstant.xLarge * 2),
          BoxButton(
            title: 'Kayıt Ol',
            onTap: () async {
              if (_formKey.currentState?.validate() ?? false) {}
            },
          ),
          SizedBox(height: WidgetSizeConstant.xLarge * 2),
          const HaveAccount(),
        ],
      ),
    );
  }

  BoxInputField phoneFormField() {
    return BoxInputField(
      controller: _phoneController,
      placeholder: 'Telefon Numarası',
      validator: (value) => checkPhoneNumber(value),
      leading: IconConstants.phone,
    );
  }

  BoxInputField surNameFormField() {
    return BoxInputField(
      controller: _surnameController,
      placeholder: 'SoyAd',
      validator: (value) => checkNull(value),
      leading: IconConstants.person,
    );
  }

  BoxInputField _nameFormField() {
    return BoxInputField(
      controller: _nameController,
      placeholder: 'Ad',
      validator: (value) => checkNull(value),
      leading: IconConstants.person,
    );
  }

  BoxInputField _emailFormField() {
    return BoxInputField(
      controller: _emailController,
      placeholder: 'E-posta',
      validator: (value) => checkEmail(value),
      leading: IconConstants.email,
    );
  }

  Widget _passwordFormField({
    required bool isObSecure,
    required void Function()? obscureTap,
  }) {
    return BoxInputField(
      controller: _passwordController,
      password: isObSecure,
      validator: (value) => checkPassword(value),
      placeholder: 'Şifre',
      trailing: Icon(isObSecure ? Icons.visibility : Icons.visibility_off),
      leading: IconConstants.lock,
      trailingTapped: obscureTap,
    );
  }
}
