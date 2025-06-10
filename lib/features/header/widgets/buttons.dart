import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/core/widgets/hover_button.dart';
import 'package:mai_coding_world/cubits/language_cubit.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HoverButton(
          onPressed: () {},
          text: "downloadCV",
          backgroundColor: Colors.blueAccent,
        ),
        const SizedBox(width: 12),
        HoverButton(
          onPressed: () {
            context.read<LanguageCubit>().toggleLanguage();
          },
          text: "language toggle",
        ),
      ],
    );
  }
}
