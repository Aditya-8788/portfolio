import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState()) {
    on<NavigationScrollChanged>(_onScrollChanged);
    on<NavigationMenuToggled>((event, emit) {
      emit(state.copyWith(menuOpen: !state.menuOpen));
    });
    on<NavigationMenuClosed>((event, emit) {
      if (state.menuOpen) emit(state.copyWith(menuOpen: false));
    });
    on<NavigationMenuOpened>((event, emit) {
      if (!state.menuOpen) emit(state.copyWith(menuOpen: true));
    });
  }

  void _onScrollChanged(
    NavigationScrollChanged event,
    Emitter<NavigationState> emit,
  ) {
    emit(NavigationState(
      activeSection: event.activeSection,
      scrolled: event.offset > 10,
      menuOpen: state.menuOpen,
    ));
  }
}