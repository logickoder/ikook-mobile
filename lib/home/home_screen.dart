import 'package:flutter/material.dart';

import '../app/scaling.dart';
import 'components/home_category.dart';
import 'components/home_section_services.dart';
import 'components/home_top.dart';
import 'data/home_categories.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: vs(16))),
            const HomeTop(),
            const HomeSectionServices(),
            SliverList.builder(
              itemBuilder: (_, index) {
                final category = homeCategories.entries.elementAt(index);
                return HomeCategory(
                  title: category.key,
                  items: category.value,
                );
              },
              itemCount: homeCategories.length,
            ),
            SliverToBoxAdapter(child: SizedBox(height: vs(16))),
          ],
        ),
      ),
    );
  }
}
