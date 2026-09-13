import 'package:flutter/material.dart';

class Certification {
  const Certification({
    required this.title,
    required this.issuer,
    required this.icon,
  });

  final String title;
  final String issuer;
  final IconData icon;
}