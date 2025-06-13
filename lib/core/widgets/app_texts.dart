// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mai_coding_world/localization/app_localizations.dart';

class MainLabelText extends StatelessWidget {
  const MainLabelText({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)?.translate(label) ?? label,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
    );
  }
}

class LabelText extends StatelessWidget {
  const LabelText({
    super.key,
    required this.label,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.color = Colors.white,
  });
  final Color? color;
  final String label;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)?.translate(label) ?? label,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: TextStyle(fontSize: 14, color: color),
    );
  }
}

class DescreptionText extends StatelessWidget {
  const DescreptionText({
    super.key,
    required this.text,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.fontSize = 14,
    this.height,
  });

  final String text;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final double fontSize;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)?.translate(text) ?? text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,

      style: TextStyle(fontSize: fontSize, color: Colors.grey, height: height),
    );
  }
}

class BigText extends StatelessWidget {
  const BigText({
    super.key,
    required this.text,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.fontSize = 36,
  });

  final String text;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)?.translate(text) ?? text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class BoldLable extends StatelessWidget {
  const BoldLable({
    super.key,
    this.color,
    required this.lable,
    this.maxLines,
    this.overflow,
    this.fontSize = 18,
  });
  final double fontSize;
  final String lable;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)?.translate(lable) ?? lable,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
