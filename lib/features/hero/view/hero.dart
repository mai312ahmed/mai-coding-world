import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/constants/app_constans.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/features/hero/widget/image_section.dart';
import 'package:mai_coding_world/features/hero/widget/texts_section.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < ScreenHelper.tablet;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 90,
        horizontal: isSmall ? smallHorizontalPadding : horizontalPadding,
      ),
      child:
          isSmall
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ImageSection(radius: screenWidth / 8),
                      SizedBox(
                        width: screenWidth - 200,
                        child: TextsSection(isSmall: isSmall),
                      ),
                    ],
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth / 2,
                    child: TextsSection(isSmall: isSmall),
                  ),
                  ImageSection(radius: screenWidth / 8),
                ],
              ),
    );
  }
}
