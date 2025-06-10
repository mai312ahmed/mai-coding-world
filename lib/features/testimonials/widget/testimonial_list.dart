import 'package:flutter/material.dart';
import 'package:mai_coding_world/features/testimonials/widget/testimonial_card.dart';

class TestimonialList extends StatelessWidget {
  const TestimonialList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TestimonialCard(
          name: 'Ahmed Ali',
          date: '2023-02-10',
          content:
              'Working with Omar was a pleasure. He\'s skilled, professional, and always willing to go the extra mile. His attention to detail is impressive.',
        ),
        TestimonialCard(
          name: 'Ahmed Ali',
          date: '2023-02-10',
          content:
              'Working with Omar was a pleasure. He\'s skilled, professional, and always willing to go the extra mile. His attention to detail is impressive.',
        ),
      ],
    );
  }
}
