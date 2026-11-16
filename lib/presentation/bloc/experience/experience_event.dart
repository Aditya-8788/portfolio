import 'package:equatable/equatable.dart';

sealed class ExperienceEvent extends Equatable {
  const ExperienceEvent();

  @override
  List<Object?> get props => [];
}

/// Fired to (re)load the experience timeline.
final class LoadExperience extends ExperienceEvent {
  const LoadExperience();
}
