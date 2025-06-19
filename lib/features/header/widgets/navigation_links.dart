import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/core/constants/app_constans.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/cubits/cubits/navigation_cubit.dart';

class NavigationLinks extends StatelessWidget {
  const NavigationLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NavigationCubit>();

    return Row(
      children:
          links.map((link) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GestureDetector(
                onTap: () => navCubit.scrollToSection(link.id),
                child: LabelText(label: link.label),
              ),
            );
          }).toList(),
    );
  }
}
