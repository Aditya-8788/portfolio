import 'package:equatable/equatable.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object?> get props => [];
}

/// Fired on every scroll tick; carries the scroll offset and the section that
/// is currently active (scroll-spy).
final class NavigationScrollChanged extends NavigationEvent {
  const NavigationScrollChanged({
    required this.offset,
    required this.activeSection,
  });

  final double offset;
  final String? activeSection;

  @override
  List<Object?> get props => [offset, activeSection];
}

/// Toggles the mobile hamburger menu.
final class NavigationMenuToggled extends NavigationEvent {
  const NavigationMenuToggled();
}

/// Closes the mobile hamburger menu (used after selecting a link).
final class NavigationMenuClosed extends NavigationEvent {
  const NavigationMenuClosed();
}

/// Opens the mobile hamburger menu.
final class NavigationMenuOpened extends NavigationEvent {
  const NavigationMenuOpened();
}