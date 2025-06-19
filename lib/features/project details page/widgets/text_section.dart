import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/animations/fade_in_animation.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.text, required this.label});

  final String text;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldLable(lable: label),
          DescreptionText(text: text, fontSize: 16, height: 1.6),
        ],
      ),
    );
  }
}
