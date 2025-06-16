import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/animations/slide_in_animation.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key, required this.features});

  final List<String> features;

  @override
  Widget build(BuildContext context) {
    return SlideInAnimation(
      begin: const Offset(-0.2, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoldLable(lable: "label_features"),
          Column(
            children: List.generate(features.length, (index) {
              return FeatureRow(text: features[index]);
            }),
          ),
        ],
      ),
    );
  }
}

class FeatureRow extends StatelessWidget {
  const FeatureRow({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check, color: Colors.white, size: 18),
        const SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }
}
