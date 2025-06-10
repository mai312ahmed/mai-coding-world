import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/animations/rotate_on_init.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.radius});
  final double radius;

  @override
  Widget build(BuildContext context) {
    return RotateOnInit(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundImage: const AssetImage('assets/images/profile.png'),
        ),
      ),
    );
  }
}
