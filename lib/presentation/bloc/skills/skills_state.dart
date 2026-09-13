import 'package:equatable/equatable.dart';

import '../../../domain/entities/skill.dart';
import '../../../domain/entities/top_skill.dart';

class SkillsState extends Equatable {
  const SkillsState({
    this.skillCategories = const [],
    this.topSkills = const [],
    this.selectedTab = 0,
  });

  final List<SkillCategory> skillCategories;
  final List<TopSkill> topSkills;
  final int selectedTab;

  SkillsState copyWith({
    List<SkillCategory>? skillCategories,
    List<TopSkill>? topSkills,
    int? selectedTab,
  }) {
    return SkillsState(
      skillCategories: skillCategories ?? this.skillCategories,
      topSkills: topSkills ?? this.topSkills,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  List<Object?> get props => [skillCategories, topSkills, selectedTab];
}