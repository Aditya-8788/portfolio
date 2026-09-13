import 'package:equatable/equatable.dart';

import '../../../domain/entities/education_item.dart';

class EducationState extends Equatable {
  const EducationState(this.educationItems);

  final List<EducationItem> educationItems;

  @override
  List<Object?> get props => [educationItems];
}