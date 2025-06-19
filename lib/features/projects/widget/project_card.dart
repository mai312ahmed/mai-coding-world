import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/features/projects/widget/card_image.dart';
import 'package:mai_coding_world/features/projects/widget/info_section.dart';
import 'package:mai_coding_world/models/project_model/project_model.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final String language;
  const ProjectCard({super.key, required this.project, required this.language});

  @override
  Widget build(BuildContext context) {
    final isSmall = ScreenHelper.isSmall(context);
    final double itemWidth = isSmall ? 320 : 350;
    final double aspectRatio = 1 / 1.5;

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: itemWidth,
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0,
              offset: const Offset(6, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardImage(project: project),
            InfoSection(project: project, language: language),
          ],
        ),
      ),
    );
  }
}
