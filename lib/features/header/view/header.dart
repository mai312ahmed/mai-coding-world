import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/features/header/widgets/buttons.dart';
import 'package:mai_coding_world/features/header/widgets/navigation_links.dart';

class Header extends StatelessWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < ScreenHelper.tablet;
    final isTablet =
        screenWidth >= ScreenHelper.tablet &&
        screenWidth < ScreenHelper.desktop;
    final isDesktop = screenWidth >= ScreenHelper.desktop;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child:
          isSmall || isTablet
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.emoji_nature),
                      const SizedBox(width: 10),
                      MainLabelText(label: "portfolio"),
                      const Spacer(),
                      Buttons(),
                    ],
                  ),
                  SizedBox(height: 15),
                  NavigationLinks(),
                ],
              )
              : Row(
                children: [
                  const Icon(Icons.emoji_nature),
                  const SizedBox(width: 10),
                  MainLabelText(label: "portfolio"),
                  const Spacer(),
                  NavigationLinks(),
                  if (isTablet) const SizedBox(width: 8),
                  if (isDesktop) const SizedBox(width: 24),
                  Buttons(),
                ],
              ),
    );
  }
}
