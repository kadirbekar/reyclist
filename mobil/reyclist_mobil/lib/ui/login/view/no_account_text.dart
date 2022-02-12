import 'package:flutter/material.dart';
import 'package:reyclist_mobil/core/init/design/color.dart';
import 'package:reyclist_mobil/core/init/design/text_style.dart';
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
        const Text("Hesabın yok mu? ", style: bodyStyle),
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterView())),
          //Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text("Kayıt Ol",
              style: heading3Style.copyWith(
                  color: kcPrimaryColor, decoration: TextDecoration.underline)),
        ),
      ],
    );
  }
}
