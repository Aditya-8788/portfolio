import 'package:flutter/material.dart';

/// Global keys used for anchor navigation between sections.
class Anchors {
  final GlobalKey about = GlobalKey();
  final GlobalKey summary = GlobalKey();
  final GlobalKey skills = GlobalKey();
  final GlobalKey education = GlobalKey();
  final GlobalKey experience = GlobalKey();
  final GlobalKey projects = GlobalKey();
  final GlobalKey certifications = GlobalKey();
  final GlobalKey contact = GlobalKey();

  GlobalKey? keyFor(String id) => switch (id) {
    'about' => about,
    'summary' => summary,
    'skills' => skills,
    'education' => education,
    'experience' => experience,
    'projects' => projects,
    'certifications' => certifications,
    'contact' => contact,
    _ => null,
  };
}
