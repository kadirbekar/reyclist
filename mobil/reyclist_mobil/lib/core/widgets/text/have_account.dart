import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../init/design/color.dart';
import '../../init/design/text_style.dart';
import '../../../ui/login/view/login_view.dart';

class HaveAccount extends StatefulWidget {
  const HaveAccount({Key? key}) : super(key: key);

  @override
  State<HaveAccount> createState() => _HaveAccountState();
}

class _HaveAccountState extends State<HaveAccount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Hesabın var mı? ", style: bodyStyle),
        GestureDetector(
          onTap: () => context.navigateToPage(const LoginView()),
          child: Text(
            "Giriş Yap",
            style: heading3Style.copyWith(
              color: kcPrimaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
