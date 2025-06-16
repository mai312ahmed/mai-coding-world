import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/core/utils/helper_method.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/cubits/language_cubit.dart';
import 'package:mai_coding_world/models/project_model/project_link.dart';

class ProjectUrlSection extends StatelessWidget {
  const ProjectUrlSection({super.key, required this.projectLinks});
  final List<ProjectLink> projectLinks;
  @override
  Widget build(BuildContext context) {
    final String language = context.read<LanguageCubit>().state.locale;
    return Column(
      children: List.generate(projectLinks.length, (index) {
        return TextButton.icon(
          onPressed:
              () =>
                  projectLinks[index].url == null
                      ? null
                      : launchURL(projectLinks[index].url!),
          icon: const Icon(Icons.open_in_new),
          label: LabelText(
            label:
                language == 'en'
                    ? projectLinks[index].name?.en ?? ""
                    : projectLinks[index].name?.ar ?? "",
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            backgroundColor: Colors.white12,
            foregroundColor: Colors.blue.shade700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }),
    );
  }
}
