import 'package:flutter/material.dart';

import 'data/repositories/portfolio_repository_impl.dart';
import 'presentation/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortfolioApp(repository: PortfolioRepositoryImpl()));
}