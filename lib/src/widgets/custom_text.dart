import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../foundation/ds_text_styles.dart';

class CustomAppText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDirection? textDirection;
  final bool? softWrap;
  
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextDecoration? decoration;

  const CustomAppText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.textDirection,
    this.softWrap,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? DSTextStyles.body;
    
    final finalStyle = baseStyle.copyWith(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize?.sp,
      decoration: decoration,
    );

    return Text(
      data,
      style: finalStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      textDirection: textDirection,
      softWrap: softWrap,
    );
  }
}
