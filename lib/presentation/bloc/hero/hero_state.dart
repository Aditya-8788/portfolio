import 'package:equatable/equatable.dart';

import '../../../domain/entities/app_links.dart';

class HeroState extends Equatable {
  const HeroState(this.appLinks);

  final AppLinks appLinks;

  @override
  List<Object?> get props => [appLinks];
}