import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/cubits/cubits/project_cubit.dart';
import 'package:mai_coding_world/features/projects/widget/projects_section_view_body.dart';

class ProjectsSectionPage extends StatelessWidget {
  const ProjectsSectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProjectCubit()..loadProjects(),
      child: ProjectsSectionView(),
    );
  }
}

class ProjectsSectionView extends StatelessWidget {
  const ProjectsSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProjectsSectionViewBody();
  }
}
