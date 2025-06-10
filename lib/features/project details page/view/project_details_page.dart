import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/animations/fade_in_animation.dart';
import 'package:mai_coding_world/core/animations/slide_in_animation.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/features/project%20details%20page/widgets/features_section.dart';
import 'package:mai_coding_world/features/project%20details%20page/widgets/image_section.dart';
import 'package:mai_coding_world/features/project%20details%20page/widgets/project_url_section.dart';
import 'package:mai_coding_world/features/project%20details%20page/widgets/technologies_section.dart';
import 'package:mai_coding_world/models/project_model.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({super.key, required this.project});
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final isSmall = ScreenHelper.isSmall(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlideInAnimation(
              begin: const Offset(0, 0.2),
              child: ImageSection(isSmall: isSmall, project: project),
            ),
            const SizedBox(height: 24),
            BoldLable(lable: "Description "),
            FadeInAnimation(
              child: DescreptionText(
                text: project.description,
                fontSize: 16,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            if (project.features.isNotEmpty)
              SlideInAnimation(
                begin: const Offset(-0.2, 0),
                child: FeaturesSection(project: project),
              ),
            const SizedBox(height: 24),

            if (project.technologies.isNotEmpty)
              SlideInAnimation(
                begin: const Offset(0.2, 0),
                child: TechnologiesSection(project: project),
              ),
            const SizedBox(height: 32),

            if (project.projectUrl.isNotEmpty) ProjectUrlSection(),
          ],
        ),
      ),
    );
  }
}
