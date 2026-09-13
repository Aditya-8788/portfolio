import 'package:equatable/equatable.dart';

sealed class HeroEvent extends Equatable {
  const HeroEvent();

  @override
  List<Object?> get props => [];
}

/// Fired to (re)load the hero's social/contact links.
final class LoadHeroLinks extends HeroEvent {
  const LoadHeroLinks();
}