import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/features/project%20details%20page/view/project_details_page.dart';
import 'package:mai_coding_world/models/project_model.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const ProjectCard({super.key, required this.project});

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
              color: Colors.black,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.asset(
                    project.imageUrl[0],
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
            ),

            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelText(
                    label: project.title,
                    color: Colors.black,

                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 8),

                  Expanded(
                    child: DescreptionText(
                      text: project.description,

                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
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
                        Text(
                          'View Details',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
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
