import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:reyclist_mobil/direction_page.dart';

import '../../../core/constants/icon_constants.dart';
import '../../../core/constants/widget_size_constant.dart';
import '../../../core/init/local_storage/shared_storage_service.dart';
import '../../../core/init/network/network_service.dart';
import '../../../core/mixin/form_validation_mixin.dart';
import '../../../core/widgets/button/box_button.dart';
import '../../../core/widgets/inputs/form_input.dart';
import '../../../product/color/app_colors.dart';
import '../../../product/text/app_strings.dart';
import '../../forgot_password/forgot_password_view.dart';
import '../login_view_model/login_view_model.dart';
import '../model/login_model.dart';
import '../service/login_service.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> with FormValidationMixin {
  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  bool remember = false;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final ILoginService _loginService;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loginService = LoginService(NetworkSettings.instance.networkManager);
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _obSecureUpdate() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void _updateLoadingStatus() => setState(() => _isLoading = !_isLoading);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _emailFormField(),
            SizedBox(height: WidgetSizeConstant.xLarge),
            _passwordFormField(
              isObSecure: _isObscure,
              obscureTap: _obSecureUpdate,
            ),
            SizedBox(height: WidgetSizeConstant.xLarge * 2),
            Row(
              children: [
                _rememberMe,
                const Text(TextConstants.loginRememberME),
                const Spacer(),
                _forgotPass,
              ],
            ),
            SizedBox(height: WidgetSizeConstant.xLarge * 2),
            BoxButton(
              title: TextConstants.loginButton,
              onTap: () async {
                FocusScope.of(context).unfocus();
                if (_formKey.currentState?.validate() ?? false) {
                  _updateLoadingStatus();
                  final LoginModel model = LoginModel(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  final response = await _loginService.login(model);
                  _updateLoadingStatus();
                  if (response != null) {
                    await SharedStorageService.instance.saveBooleanValue(SharedEnum.login.name, response.isOk ?? false);
                    context.read<UserContext>().setUserData(response.data);
                    await SharedStorageService.instance.saveModel(SharedEnum.user.name, response.data);
                    context.navigateToPage(const DirectionPage());
                  }
                }
              },
              busy: _isLoading,
            )
          ],
        ));
  }

  Widget _passwordFormField({
    required bool isObSecure,
    required void Function()? obscureTap,
  }) {
    return BoxInputField(
      controller: _passwordController,
      password: isObSecure,
      validator: (value) => checkPassword(value),
      placeholder: TextConstants.password,
      trailing: Icon(isObSecure ? Icons.visibility : Icons.visibility_off),
      leading: IconConstants.lock,
      trailingTapped: obscureTap,
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

  Widget get _rememberMe => Checkbox(
        value: remember,
        activeColor: AppColor.appBlackColorTheme,
        onChanged: (value) {
          setState(() {
            remember = value ?? false;
          });
        },
      );

  Widget get _forgotPass => GestureDetector(
        onTap: () => context.navigateToPage(const ForgotPasswordView()),
        child: const Text(
          TextConstants.forgotPassword,
          style: TextStyle(decoration: TextDecoration.underline),
        ),
      );
}
