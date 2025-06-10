import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/animations/fade_in_animation.dart';
import 'package:mai_coding_world/core/constants/app_constans.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmall = ScreenHelper.isSmall(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? smallHorizontalPadding : horizontalPadding,
        vertical: 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: 'aboutMe'),
          const SizedBox(height: 50),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 4, color: Colors.blueAccent),
                SizedBox(width: 20),
                Expanded(
                  child: FadeInAnimation(
                    child: LabelText(label: 'aboutMeContent'),
                  ),
                ),
                SizedBox(width: 20),
                Image.asset(
                  'assets/images/about_pic.png',
                  width: 150,
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
