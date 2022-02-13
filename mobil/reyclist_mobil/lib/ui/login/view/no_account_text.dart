import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../product/color/app_colors.dart';
import '../../../product/text/app_strings.dart';
import '../../register/view/register_view.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(TextConstants.questionLogin, style: context.textTheme.headline6),
        TextButton(
          onPressed: () => context.navigateToPage(const RegisterView()),
          child: Text(
            TextConstants.loginText,
            style: context.textTheme.headline6?.copyWith(color: AppColor.appThemeColor),
          ),
        )
      ],
    );
  }
}
