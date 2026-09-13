import 'package:flutter/material.dart';

class EducationItem {
  const EducationItem({
    required this.degree,
    required this.institute,
    required this.period,
    required this.tag,
    required this.icon,
  });

  final String degree;
  final String institute;
  final String period;
  final String tag;
  final IconData icon;
}