import 'package:equatable/equatable.dart';

import '../../../domain/entities/summary_info.dart';

class SummaryState extends Equatable {
  const SummaryState(this.summary);

  final SummaryInfo summary;

  @override
  List<Object?> get props => [summary];
}
