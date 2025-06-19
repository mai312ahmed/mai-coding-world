import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/core/constants/app_constans.dart';
import 'package:mai_coding_world/core/widgets/hover_button.dart';
import 'package:mai_coding_world/cubits/cubits/navigation_cubit.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NavigationCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HoverButton(
            onPressed: () => navCubit.scrollToSection(links[4].id),
            text: "getInTouch",
          ),
          SizedBox(width: 20),
          HoverButton(
            onPressed: () => navCubit.scrollToSection(links[1].id),
            text: "browseProjects",
          ),
        ],
      ),
    );
  }
}
