import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/core/constants/app_constans.dart';
import 'package:mai_coding_world/core/utils/screen_helper.dart';
import 'package:mai_coding_world/core/widgets/app_texts.dart';
import 'package:mai_coding_world/cubits/cubits/language_cubit.dart';
import 'package:mai_coding_world/cubits/cubits/project_cubit.dart';
import 'package:mai_coding_world/features/projects/widget/project_card.dart';
import 'package:mai_coding_world/models/project_model/project_model.dart';

class ProjectsSectionViewBody extends StatelessWidget {
  const ProjectsSectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmall = ScreenHelper.isSmall(context);
    String language = context.read<LanguageCubit>().state.locale;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 50,
        horizontal: isSmall ? smallHorizontalPadding : horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: 'projects'),
          const SizedBox(height: 50),
          BlocBuilder<ProjectCubit, ProjectState>(
            builder: (context, state) {
              if (state is ProjectLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProjectLoaded) {
                return ProjectsList(
                  isSmall: isSmall,
                  projects: state.projects,
                  language: language,
                );
              } else if (state is ProjectError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}

class ProjectsList extends StatelessWidget {
  const ProjectsList({
    super.key,
    required this.isSmall,
    required this.projects,
    required this.language,
  });
  final List<ProjectModel> projects;
  final bool isSmall;
  final String language;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isSmall ? 350 : 400,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return ProjectCard(project: projects[index], language: language);
          },
        ),
      ),
    );
  }
}
