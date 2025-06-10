import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/widgets/project_image.dart';
import 'package:mai_coding_world/models/project_model.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.isSmall, required this.project});

  final bool isSmall;
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isSmall ? 400 : 450,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: project.imageUrl.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ProjectImage(image: project.imageUrl[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
