import 'package:equatable/equatable.dart';

sealed class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object?> get props => [];
}

/// Fired when the contact form is submitted.
final class ContactSubmitted extends ContactEvent {
  const ContactSubmitted();
}

/// Fired to reset the contact form after a successful submission.
final class ContactFormReset extends ContactEvent {
  const ContactFormReset();
}