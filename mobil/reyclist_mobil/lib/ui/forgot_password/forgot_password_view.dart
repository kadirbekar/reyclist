import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/constants/icon_constants.dart';
import '../../core/constants/widget_size_constant.dart';
import '../../core/mixin/form_validation_mixin.dart';
import '../../core/widgets/button/box_button.dart';
import '../../core/widgets/inputs/form_input.dart';
import '../../product/color/app_colors.dart';
import '../../product/text/app_strings.dart';
import '../login/view/login_view.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> with FormValidationMixin {
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
          leading: IconButton(
              onPressed: () {
                context.navigateToPage(LoginView());
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: AppColor.appThemeColor,
          centerTitle: true,
          title: const Text(
            TextConstants.forgotPassword,
          )),
      body: Padding(
        padding: context.paddingMedium,
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(TextConstants.paswordMessage, style: context.textTheme.headline6),
            SizedBox(height: context.dynamicHeight(0.06)),
            _emailFormField(),
            SizedBox(height: WidgetSizeConstant.xLarge * 2),
            BoxButton(
              title: TextConstants.sendMessage,
              onTap: () {
                if (_formKey.currentState?.validate() ?? false) {}
              },
            ),
            SizedBox(height: WidgetSizeConstant.xLarge),
          ]),
        )),
      ),
    );
  }

  BoxInputField _emailFormField() {
    return BoxInputField(
      controller: _emailController,
      placeholder: TextConstants.eMail,
      validator: (value) => checkEmail(value),
      leading: IconConstants.email,
    );
  }
}
