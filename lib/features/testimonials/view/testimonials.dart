import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/constants/app_constans.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/features/testimonials/widget/testimonial_list.dart';
import '../../../../localization/app_localizations.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

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
          BigText(
            text:
                AppLocalizations.of(context)?.translate('testimonials') ??
                'testimonials',
          ),
          const SizedBox(height: 20),
          const TestimonialList(),
        ],
      ),
    );
  }
}
