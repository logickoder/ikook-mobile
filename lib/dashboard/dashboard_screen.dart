import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app/components/bottom_bar.dart';
import '../home/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String route = '/dashboard';

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _currentScreen = BottomBarItem.home;

  static const _screens = [
    HomeScreen(),
    Center(child: Text('Favourite')),
    Center(child: Text('Bookings')),
    Center(child: Text('Message')),
    Center(child: Text('Account')),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final overlayStyle = theme.brightness == Brightness.light
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;
    return Scaffold(
      body: AnnotatedRegion(
        value: overlayStyle.copyWith(
          statusBarColor: theme.scaffoldBackgroundColor,
          systemNavigationBarColor: theme.scaffoldBackgroundColor,
        ),
        child: IndexedStack(
          index: _currentScreen.index,
          children: _screens,
        ),
      ),
      bottomNavigationBar: BottomBar(
        selected: _currentScreen,
        onSelected: (item) => setState(() => _currentScreen = item),
      ),
    );
  }
}
