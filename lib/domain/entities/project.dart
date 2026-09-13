import 'package:flutter/material.dart';

class Project {
  const Project({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.tags,
    required this.bullets,
    required this.categories,
    this.githubUrl,
    this.codeAvailable = false,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> tags;
  final List<String> bullets;
  final List<String> categories;
  final String? githubUrl;
  final bool codeAvailable;
}