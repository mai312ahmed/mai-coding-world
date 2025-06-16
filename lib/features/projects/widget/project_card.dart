import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/cubits/language_cubit.dart';
import 'package:mai_coding_world/features/project%20details%20page/view/project_details_page.dart';
import 'package:mai_coding_world/models/project_model/project_model.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final String language = context.read<LanguageCubit>().state.locale;
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
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  project.imageUrls!.isNotEmpty ? project.imageUrls![0] : "",
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                  errorBuilder:
                      (_, __, ___) => Container(
                        color: Colors.grey[200],
                        child: const Center(
                          child: Icon(
                            Icons.broken_image_outlined,
                            size: 100,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                ),
              ),
            ),

            SizedBox(
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ProjectDetailsPage(project: project),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        LabelText(label: "viewDetails", color: Colors.black),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
