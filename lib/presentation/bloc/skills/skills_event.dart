import 'package:equatable/equatable.dart';

sealed class SkillsEvent extends Equatable {
  const SkillsEvent();

  @override
  List<Object?> get props => [];
}

/// Fired when the user selects a skill category tab.
final class SkillTabSelected extends SkillsEvent {
  const SkillTabSelected(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}