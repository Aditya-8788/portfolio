import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_contact_links.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc({required GetContactLinks getContactLinks})
      : super(ContactState(contactLinks: getContactLinks())) {
    on<ContactSubmitted>(_onSubmitted);
    on<ContactFormReset>(_onFormReset);
  }

  void _onSubmitted(ContactSubmitted event, Emitter<ContactState> emit) {
    emit(state.copyWith(submitting: true));
    emit(state.copyWith(submitting: false, submitted: true));
  }

  void _onFormReset(ContactFormReset event, Emitter<ContactState> emit) {
    if (state.submitting || state.submitted) {
      emit(state.copyWith(submitting: false, submitted: false));
    }
  }
}