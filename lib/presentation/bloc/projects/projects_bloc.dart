import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_projects.dart';
import 'projects_event.dart';
import 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc({required GetProjects getProjects})
      : super(ProjectsState(projects: getProjects())) {
    on<ProjectFilterChanged>(_onFilterChanged);
    on<ProjectExpansionToggled>(_onExpansionToggled);
  }

  void _onFilterChanged(ProjectFilterChanged event, Emitter<ProjectsState> emit) {
    if (event.filter != state.filter) {
      emit(state.copyWith(filter: event.filter, expanded: const {}));
    }
  }

  void _onExpansionToggled(
    ProjectExpansionToggled event,
    Emitter<ProjectsState> emit,
  ) {
    final expanded = Set<String>.from(state.expanded);
    if (!expanded.add(event.projectTitle)) {
      expanded.remove(event.projectTitle);
    }
    emit(state.copyWith(expanded: expanded));
  }
}