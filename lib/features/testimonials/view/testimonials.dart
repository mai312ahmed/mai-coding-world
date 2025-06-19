import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/cubits/cubits/testimonails_cubit.dart';
import 'package:mai_coding_world/features/testimonials/widget/testimonials_section_view_body.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestimonailsCubit()..loadTestimonails(),
      child: TestimonialsSectionView(),
    );
  }
}

class TestimonialsSectionView extends StatelessWidget {
  const TestimonialsSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return TestimonialsSectionViewBody();
  }
}
