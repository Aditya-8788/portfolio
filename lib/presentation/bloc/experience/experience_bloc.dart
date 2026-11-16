import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_experience.dart';
import 'experience_event.dart';
import 'experience_state.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  ExperienceBloc({required GetExperience getExperience})
    : super(ExperienceState(getExperience())) {
    on<LoadExperience>((event, emit) => emit(ExperienceState(getExperience())));
  }
}
