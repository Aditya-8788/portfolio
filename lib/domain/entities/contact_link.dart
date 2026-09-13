import 'package:flutter/material.dart';

class ContactLink {
  const ContactLink({
    required this.label,
    required this.value,
    required this.icon,
    this.url,
  });

  final String label;
  final String value;
  final IconData icon;
  final String? url;
}