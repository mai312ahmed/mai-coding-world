import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/models/project_model.dart';

class TechnologiesSection extends StatelessWidget {
  const TechnologiesSection({super.key, required this.project});
  final ProjectModel project;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldLable(lable: 'Technologies Used'),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children:
              project.technologies
                  .map(
                    (tech) => Chip(
                      label: Text(tech),
                      backgroundColor: Colors.white12,
                      side: BorderSide(style: BorderStyle.solid),
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
