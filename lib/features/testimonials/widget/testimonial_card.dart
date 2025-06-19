import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';

class TestimonialCard extends StatelessWidget {
  const TestimonialCard({
    super.key,
    required this.writer,
    required this.date,
    required this.content,
    required this.rating,
  });
  final String writer;
  final Timestamp date;
  final String content;
  final int rating;
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
              children: [
                MainLabelText(label: writer),
                LabelText(
                  label:
                      "${date.toDate().year}-${date.toDate().month.toString().padLeft(2, '0')}-${date.toDate().day.toString().padLeft(2, '0')}",
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: index < rating ? Colors.amber : Colors.grey,
                );
              }),
            ),
            const SizedBox(height: 10),
            LabelText(label: content),
          ],
        ),
      ),
    );
  }
}
