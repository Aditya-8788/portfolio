import 'package:flutter/material.dart';

class SkillCategory {
  const SkillCategory({
    required this.label,
    required this.icon,
    required this.skills,
  });

  final String label;
  final IconData icon;
  final List<Skill> skills;
}

class Skill {
  const Skill({required this.name, this.core = false});

  final String name;
  final bool core;
}