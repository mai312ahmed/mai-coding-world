import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/animations/slide_in_animation.dart';
import 'package:mai_coding_world/core/widgets/project_image.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.isSmall, required this.images});

  final bool isSmall;
  final List images;

  @override
  Widget build(BuildContext context) {
    return SlideInAnimation(
      begin: const Offset(0, -0.3),

      child: SizedBox(
        height: isSmall ? 400 : 450,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: ProjectImage(image: images[index]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
