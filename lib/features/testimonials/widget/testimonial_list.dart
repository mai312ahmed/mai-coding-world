import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mai_coding_world/features/testimonials/widget/testimonial_card.dart';
import 'package:mai_coding_world/models/project_model/testimonails_model.dart';

class TestimonialList extends StatelessWidget {
  const TestimonialList({super.key, required this.testimonials});
  final List<TestimonailsModel> testimonials;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        testimonials.length,
        (index) => TestimonialCard(
          writer: testimonials[index].writer ?? "",
          date: testimonials[index].date ?? Timestamp.now(),
          content: testimonials[index].content ?? "",
          rating: testimonials[index].rating ?? 0,
        ),
      ),
    );
  }
}
