import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_summary.dart';
import 'summary_event.dart';
import 'summary_state.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  SummaryBloc({required GetSummary getSummary})
    : super(SummaryState(getSummary())) {
    on<LoadSummary>((event, emit) => emit(SummaryState(getSummary())));
  }
}
