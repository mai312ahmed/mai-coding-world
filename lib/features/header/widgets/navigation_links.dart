import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';

class NavigationLinks extends StatelessWidget {
  const NavigationLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final links = [
      {'label': 'aboutMe', 'id': 'about'},
      {'label': 'projects', 'id': 'projects'},
      {'label': 'resume', 'id': 'resume'},
      {'label': 'testimonials', 'id': 'testimonials'},
    ];

    return Row(
      children:
          links.map((link) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GestureDetector(
                onTap: () {
                  // TODO: Scroll to section by id
                  debugPrint("Navigate to ${link['id']}");
                },
                child: LabelText(label: link['label']!),
              ),
            );
          }).toList(),
    );
  }
}
