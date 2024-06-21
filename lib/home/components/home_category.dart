import 'package:flutter/material.dart';

import '../../app/scaling.dart';
import 'home_card.dart';
import 'home_section.dart';

class HomeCategory extends StatelessWidget {
  final String title;
  final List<dynamic> items;

  const HomeCategory({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return HomeSection(
      title: title,
      child: AspectRatio(
        aspectRatio: 428 / 203,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: s(18)),
          itemBuilder: (_, index) => HomeCard(items[index]),
          separatorBuilder: (_, __) => SizedBox(width: s(12)),
          itemCount: items.length,
        ),
      ),
    );
  }
}
