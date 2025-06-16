import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/core/animations/fade_in_animation.dart';
import 'package:mai_coding_world/core/animations/slide_in_animation.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/core/widgets/keyboard_scroll_controller.dart';
import 'package:mai_coding_world/cubits/language_cubit.dart';
import 'package:mai_coding_world/features/project%20details%20page/widgets/features_section.dart';
import 'package:mai_coding_world/features/project%20details%20page/widgets/image_section.dart';
import 'package:mai_coding_world/features/project%20details%20page/widgets/project_url_section.dart';
import 'package:mai_coding_world/features/project%20details%20page/widgets/technologies_section.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/models/project_model/project_model.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({super.key, required this.project});
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final isSmall = ScreenHelper.isSmall(context);

    final String language = context.read<LanguageCubit>().state.locale;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          language == 'ar' ? project.title?.ar ?? "" : project.title?.en ?? "",
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: KeyboardScrollable(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (project.imageUrls?.isNotEmpty ?? false)
                ImageSection(isSmall: isSmall, images: project.imageUrls ?? []),
              const SizedBox(height: 24),
              if (language == 'en'
                  ? project.description?.en?.isNotEmpty ?? false
                  : project.description?.ar?.isNotEmpty ?? false)
                TextSection(
                  text:
                      language == 'en'
                          ? project.description?.en ?? ""
                          : project.description?.ar ?? "",
                  label: "label_description",
                ),
              const SizedBox(height: 24),
              if (language == 'en'
                  ? project.features?.en?.isNotEmpty ?? false
                  : project.features?.ar?.isNotEmpty ?? false)
                FeaturesSection(
                  features:
                      language == 'en'
                          ? project.features?.en ?? []
                          : project.features?.ar ?? [],
                ),
              const SizedBox(height: 24),

              if (language == 'en'
                  ? project.technologies?.en?.isNotEmpty ?? false
                  : project.technologies?.ar?.isNotEmpty ?? false)
                SlideInAnimation(
                  begin: const Offset(0.2, 0),
                  child: TechnologiesSection(
                    technologies:
                        language == 'en'
                            ? project.technologies?.en ?? []
                            : project.technologies?.ar ?? [],
                  ),
                ),
              const SizedBox(height: 24),
              if (language == 'en'
                  ? project.languages?.en?.isNotEmpty ?? false
                  : project.description?.ar?.isNotEmpty ?? false)
                TextSection(
                  text:
                      language == 'en'
                          ? project.languages?.en ?? ""
                          : project.languages?.ar ?? "",
                  label: "languages",
                ),
              const SizedBox(height: 24),
              if (project.projectLinks?.isNotEmpty ?? false)
                ProjectUrlSection(projectLinks: project.projectLinks ?? []),
            ],
          ),
        ),
      ),
    );
  }
}

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
