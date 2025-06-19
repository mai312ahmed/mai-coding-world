import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/features/projects/widget/view_details.dart';
import 'package:mai_coding_world/models/project_model/project_model.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key, required this.project, required this.language});
  final String language;
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          BoldLable(
            lable:
                language == "ar"
                    ? project.title?.ar ?? "اسم التطبيق"
                    : project.title?.en ?? "App Name",
            color: Colors.black,
            fontSize: 16,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 8),

          Expanded(
            child: DescreptionText(
              text:
                  language == "ar"
                      ? project.description?.ar ?? ""
                      : project.description?.en ?? "",

              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ViewDetails(project: project),
        ],
      ),
    );
  }
}
