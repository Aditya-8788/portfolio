import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_skill_categories.dart';
import '../../../domain/usecases/get_top_skills.dart';
import 'skills_event.dart';
import 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  SkillsBloc({
    required GetSkillCategories getSkillCategories,
    required GetTopSkills getTopSkills,
  }) : super(SkillsState(
          skillCategories: getSkillCategories(),
          topSkills: getTopSkills(),
        )) {
    on<SkillTabSelected>(_onTabSelected);
  }

  void _onTabSelected(SkillTabSelected event, Emitter<SkillsState> emit) {
    if (event.index != state.selectedTab) {
      emit(state.copyWith(selectedTab: event.index));
    }
  }
}