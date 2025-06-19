import 'package:flutter/material.dart';
import 'package:mai_coding_world/models/project_model/project_model.dart';

class CardImage extends StatelessWidget {
  const CardImage({super.key, required this.project});

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
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
    );
  }
}
