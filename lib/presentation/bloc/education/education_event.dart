import 'package:equatable/equatable.dart';

sealed class EducationEvent extends Equatable {
  const EducationEvent();

  @override
  List<Object?> get props => [];
}

/// Fired to (re)load the education timeline.
final class LoadEducation extends EducationEvent {
  const LoadEducation();
}