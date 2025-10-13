import 'package:api_test/core/common/styles/global_text_style.dart';
import 'package:flutter/material.dart';

class TextProperty extends StatelessWidget {
  final bool? softWrap;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double lineHeight;

  const TextProperty({
    this.softWrap,
    super.key,
    this.maxLines,
    this.overflow,
    this.textAlign,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight,
    required this.lineHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      softWrap: softWrap,
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: getTextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        lineHeight: lineHeight,
      ),
    );
  }
}
