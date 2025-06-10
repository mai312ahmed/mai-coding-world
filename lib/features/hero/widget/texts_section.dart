import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/animations/fade_in_animation.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/features/hero/widget/buttons_section.dart';

class TextsSection extends StatelessWidget {
  const TextsSection({super.key, required this.isSmall});
  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: Column(
        crossAxisAlignment:
            isSmall ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          MainLabelText(label: "my name"),
          BigText(text: "flutterDeveloper"),
          DescreptionText(text: "passionateAbout"),
          ButtonsSection(),
        ],
      ),
    );
  }
}
