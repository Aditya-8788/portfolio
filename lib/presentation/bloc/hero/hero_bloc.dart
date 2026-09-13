import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_app_links.dart';
import 'hero_event.dart';
import 'hero_state.dart';

class HeroBloc extends Bloc<HeroEvent, HeroState> {
  HeroBloc({required GetAppLinks getAppLinks})
      : super(HeroState(getAppLinks())) {
    on<LoadHeroLinks>((event, emit) => emit(HeroState(getAppLinks())));
  }
}