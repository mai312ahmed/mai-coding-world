import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/animations/slide_in_animation.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/features/project%20details%20page/widgets/feature_row.dart';

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
