import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  const ProjectImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        image,
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
    );
  }
}
