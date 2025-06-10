import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({
    super.key,
    required this.name,
    required this.date,
    required this.content,
  });
  final String name;
  final String date;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [MainLabelText(label: name), LabelText(label: date)],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star_border, color: Colors.amber),
                Icon(Icons.star_border, color: Colors.amber),
              ],
            ),
            const SizedBox(height: 10),
            LabelText(label: content),
          ],
        ),
      ),
    );
  }
}
