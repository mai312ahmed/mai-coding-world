import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';

class TechnologiesSection extends StatelessWidget {
  const TechnologiesSection({super.key, required this.technologies});
  final List technologies;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldLable(lable: "label_technologies_used"),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            technologies.length,
            (index) => Chip(
              label: Text(technologies[index]),
              backgroundColor: Colors.white12,
              side: BorderSide(style: BorderStyle.solid),
              labelStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
