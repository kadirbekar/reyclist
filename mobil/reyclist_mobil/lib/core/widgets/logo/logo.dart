import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../product/color/app_colors.dart';
import '../../../product/text/app_strings.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  get kcPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicHeight(0.12),
      height: context.dynamicWidth(0.2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: context.lowBorderRadius,
        color: AppColor.appThemeColor,
      ),
      child: Text(TextConstants.loginAppTiitle,
          style: context.textTheme.headline2
              ?.copyWith(color: context.colorScheme.onSecondary, fontWeight: FontWeight.bold)),
    );
  }
}
