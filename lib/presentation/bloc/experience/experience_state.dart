import 'package:equatable/equatable.dart';

import '../../../domain/entities/experience_item.dart';

class ExperienceState extends Equatable {
  const ExperienceState(this.experienceItems);

  final List<ExperienceItem> experienceItems;

  @override
  List<Object?> get props => [experienceItems];
}
