import 'package:flutter/material.dart';

class ExperienceItem {
  const ExperienceItem({
    required this.role,
    required this.company,
    required this.location,
    required this.period,
    required this.icon,
    required this.highlights,
    this.current = false,
    this.projects = const [],
    this.tags = const [],
  });

  final String role;
  final String company;
  final String location;
  final String period;
  final IconData icon;
  final List<String> highlights;
  final bool current;
  final List<String> projects;
  final List<String> tags;
}
