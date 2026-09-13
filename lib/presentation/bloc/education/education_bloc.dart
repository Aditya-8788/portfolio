import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_education.dart';
import 'education_event.dart';
import 'education_state.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  EducationBloc({required GetEducation getEducation})
      : super(EducationState(getEducation())) {
    on<LoadEducation>((event, emit) => emit(EducationState(getEducation())));
  }
}