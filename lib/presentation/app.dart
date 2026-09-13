import 'dart:ui';

import 'package:flutter/material.dart';

import '../domain/repositories/portfolio_repository.dart';
import 'pages/portfolio_page.dart';
import 'theme/app_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key, required this.repository});

  final PortfolioRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aditya Khochikar — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      scrollBehavior: const _AppScrollBehavior(),
      home: PortfolioPage(repository: repository),
    );
  }
}

class _AppScrollBehavior extends MaterialScrollBehavior {
  const _AppScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}