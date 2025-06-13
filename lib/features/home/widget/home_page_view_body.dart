import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/core/widgets/keyboard_scroll_controller.dart';
import 'package:mai_coding_world/cubits/navigation_cubit.dart';
import 'package:mai_coding_world/features/about/view/about.dart';
import 'package:mai_coding_world/features/contact/view/contact_section.dart';
import 'package:mai_coding_world/features/header/view/header.dart';
import 'package:mai_coding_world/features/hero/view/hero.dart';
import 'package:mai_coding_world/features/projects/view/projects.dart';
import 'package:mai_coding_world/features/skills/view/skills.dart';
import 'package:mai_coding_world/features/testimonials/view/testimonials.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NavigationCubit>();
    final keys = navCubit.sectionKeys;

    return BlocListener<NavigationCubit, NavigationState>(
      listenWhen: (prev, current) => prev.scrollToId != current.scrollToId,
      listener: (context, state) {
        final id = state.scrollToId;
        if (id != null && keys.containsKey(id)) {
          final key = keys[id];
          final contextFromKey = key?.currentContext;
          if (contextFromKey != null) {
            Scrollable.ensureVisible(
              contextFromKey,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        }
      },
      child: Scaffold(
        body: KeyboardScrollable(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                const Divider(height: 0),
                const HeroSection(),
                const Divider(height: 0, endIndent: 50, indent: 50),
                AboutMeSection(key: keys['about']),
                const Divider(height: 0, endIndent: 50, indent: 50),
                ProjectsSection(key: keys['projects']),
                const Divider(height: 0, endIndent: 50, indent: 50),
                SkillsSection(key: keys['skills']),
                const Divider(height: 0, endIndent: 50, indent: 50),
                TestimonialsSection(key: keys['testimonials']),
                const Divider(height: 0, endIndent: 50, indent: 50),
                ContactSection(key: keys['contactMe']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
