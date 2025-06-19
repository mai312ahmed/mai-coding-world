import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/core/constants/app_constans.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/cubits/cubits/testimonails_cubit.dart';
import 'package:mai_coding_world/features/testimonials/widget/add_testimonials_section.dart';
import 'package:mai_coding_world/features/testimonials/widget/testimonial_list.dart';

class TestimonialsSectionViewBody extends StatelessWidget {
  const TestimonialsSectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmall = ScreenHelper.isSmall(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? smallHorizontalPadding : horizontalPadding,
        vertical: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: 'testimonials'),
          const SizedBox(height: 20),
          BlocBuilder<TestimonailsCubit, TestimonailsState>(
            builder: (context, state) {
              if (state.loadStatus == LoadTestimonailsStatus.loading &&
                  state.testimonails.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.loadStatus == LoadTestimonailsStatus.error &&
                  state.testimonails.isEmpty) {
                return Center(child: Text(state.errorMessage));
              }
              return TestimonialList(testimonials: state.testimonails);
            },
          ),
          AddTestimonialsSection(),
        ],
      ),
    );
  }
}
