import 'package:equatable/equatable.dart';

sealed class SummaryEvent extends Equatable {
  const SummaryEvent();

  @override
  List<Object?> get props => [];
}

/// Fired to (re)load the professional summary.
final class LoadSummary extends SummaryEvent {
  const LoadSummary();
}
