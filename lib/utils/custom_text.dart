import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 import 'fh_color_provider.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextScaler? textScaler;
  final StrutStyle? strutStyle;
  final Color? color;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;

  const CustomText(this.text,{
    super.key,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.textScaler,
    this.strutStyle,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<ColorNotifier>(context);
    return Text(
      text,
      style: style ?? TextStyle(fontSize: (fontSize ?? 12)/MediaQuery.of(context)
          .textScaler
          .scale(1),color: color ?? notifier.textColor,fontWeight: fontWeight,
        decoration: textDecoration,
      ),
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      textScaler: textScaler,
      strutStyle: strutStyle,
    );
  }
}
