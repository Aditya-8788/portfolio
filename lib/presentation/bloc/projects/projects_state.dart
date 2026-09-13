import 'package:equatable/equatable.dart';

import '../../../domain/entities/project.dart';

class ProjectsState extends Equatable {
  const ProjectsState({
    this.projects = const [],
    this.filter = 'All',
    this.expanded = const {},
  });

  final List<Project> projects;
  final String filter;
  final Set<String> expanded;

  List<Project> get filteredProjects {
    if (filter == 'All') return projects;
    return projects.where((p) => p.categories.contains(filter)).toList();
  }

  ProjectsState copyWith({
    List<Project>? projects,
    String? filter,
    Set<String>? expanded,
  }) {
    return ProjectsState(
      projects: projects ?? this.projects,
      filter: filter ?? this.filter,
      expanded: expanded ?? this.expanded,
    );
  }

  @override
  List<Object?> get props => [projects, filter, expanded];
}