import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mai_coding_world/models/project_model/project_model.dart';
import 'package:mai_coding_world/services/project_service.dart';

part '../states/project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit() : super(ProjectInitial());

  Future<void> loadProjects() async {
    try {
      emit(ProjectLoading());
      final projects = await ProjectService().getProjects() ?? [];
      emit(ProjectLoaded(projects));
    } catch (e) {
      emit(ProjectError(e.toString()));
    }
  }
}
