import 'package:flutter/material.dart';
import 'package:mai_coding_world/features/header/view/header.dart';
import 'package:mai_coding_world/features/about/view/about.dart';
import 'package:mai_coding_world/features/hero/view/hero.dart';
import 'package:mai_coding_world/features/projects/view/projects.dart';
import 'package:mai_coding_world/features/testimonials/view/testimonials.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Header(),
            Divider(height: 0),
            HeroSection(),
            Divider(height: 0, endIndent: 50, indent: 50),
            AboutMeSection(),
            Divider(height: 0, endIndent: 50, indent: 50),
            ProjectsSection(),
            Divider(height: 0, endIndent: 50, indent: 50),
            TestimonialsSection(),
          ],
        ),
      ),
    );
  }
}
