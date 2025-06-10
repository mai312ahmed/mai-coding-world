import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/models/project_model.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldLable(lable: 'Features'),
        const SizedBox(height: 12),
        ...project.features.map(
          (f) => Row(
            children: [
              const Icon(Icons.check, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Expanded(child: Text(f)),
            ],
          ),
        ),
      ],
    );
  }
}
