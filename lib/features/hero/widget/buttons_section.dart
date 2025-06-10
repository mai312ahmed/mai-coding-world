import 'package:flutter/material.dart';
import 'package:mai_coding_world/core/widgets/hover_button.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HoverButton(onPressed: () {}, text: "Get in touch"),
          SizedBox(width: 20),
          HoverButton(onPressed: () {}, text: "Browse Projects"),
        ],
      ),
    );
  }
}
