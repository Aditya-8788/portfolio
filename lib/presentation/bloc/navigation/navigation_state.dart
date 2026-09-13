import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  const NavigationState({
    this.activeSection,
    this.scrolled = false,
    this.menuOpen = false,
  });

  final String? activeSection;
  final bool scrolled;
  final bool menuOpen;

  NavigationState copyWith({
    String? activeSection,
    bool? scrolled,
    bool? menuOpen,
  }) {
    return NavigationState(
      activeSection: activeSection ?? this.activeSection,
      scrolled: scrolled ?? this.scrolled,
      menuOpen: menuOpen ?? this.menuOpen,
    );
  }

  @override
  List<Object?> get props => [activeSection, scrolled, menuOpen];
}