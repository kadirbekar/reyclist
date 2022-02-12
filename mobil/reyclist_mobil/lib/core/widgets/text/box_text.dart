import 'package:flutter/material.dart';
import 'package:reyclist_mobil/core/init/design/color.dart';
import 'package:reyclist_mobil/core/init/design/text_style.dart';

class BoxText extends StatelessWidget {
  
  final String text;
  final TextStyle style;

  const BoxText.headingOne(this.text) : style = heading1Style;
  const BoxText.headingTwo(this.text) : style = heading2Style;
  const BoxText.headingThree(this.text) : style = heading3Style;
  const BoxText.headline(this.text) : style = headlineStyle;
  const BoxText.subheading(this.text) : style = subheadingStyle;
  const BoxText.caption(this.text) : style = captionStyle;

  BoxText.body(this.text, {Color color = kcMediumGreyColor})
      : style = bodyStyle.copyWith(color: color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}