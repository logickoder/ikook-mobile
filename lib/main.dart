import 'package:flutter/material.dart';

import 'app/scaling.dart';
import 'app/theme.dart';
import 'dashboard/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    initializeScaling(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iKooK',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
    );
  }
}
