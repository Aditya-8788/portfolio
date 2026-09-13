import 'package:equatable/equatable.dart';

sealed class ProjectsEvent extends Equatable {
  const ProjectsEvent();

  @override
  List<Object?> get props => [];
}

/// Fired when the active project category filter changes.
final class ProjectFilterChanged extends ProjectsEvent {
  const ProjectFilterChanged(this.filter);

  final String filter;

  @override
  List<Object?> get props => [filter];
}

/// Fired when a project body is expanded/collapsed.
final class ProjectExpansionToggled extends ProjectsEvent {
  const ProjectExpansionToggled(this.projectTitle);

  final String projectTitle;

  @override
  List<Object?> get props => [projectTitle];
}