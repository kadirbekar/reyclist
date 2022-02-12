import 'package:flutter/material.dart';
import 'package:reyclist_mobil/core/init/design/text_style.dart';
import 'package:reyclist_mobil/core/widgets/button/box_button.dart';
import 'package:reyclist_mobil/core/widgets/inputs/form_input.dart';
import 'package:reyclist_mobil/core/widgets/text/have_account.dart';

import '../../core/constants/icon_constants.dart';
import '../../core/constants/widget_size_constants.dart';
import '../../core/mixin/form_validation_mixin.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView>
    with FormValidationMixin {
  late final TextEditingController? _emailController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Şifremi Unuttum',
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
              child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.grey,
                    child: const Text('Resim'),
                    height: 200,
                    width: 400,
                  ),
                  SizedBox(height: WidgetSizeConstant.xLarge),
                  const Text(
                    '*Şifre Sıfırlama Bağlantısı e-posta adresinize gönderilecektir.',
                    style: bodyStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: WidgetSizeConstant.xLarge),
                  _emailFormField(),
                  SizedBox(height: WidgetSizeConstant.xLarge * 2),
                  BoxButton(
                    title: 'Gönder',
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {}
                    },
                  ),
                  SizedBox(height: WidgetSizeConstant.xLarge),
                  const HaveAccount(),
                ]),
          )),
        ),
      ),
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
}
