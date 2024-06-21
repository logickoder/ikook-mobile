import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/assets.dart';
import '../../app/scaling.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: s(18)),
        child: Column(
          children: [
            Row(
              children: [
                FilledButton(onPressed: () {}, child: const Text('Login')),
                SizedBox(width: s(8)),
                OutlinedButton(onPressed: () {}, child: const Text('Sign up')),
                const Spacer(),
                Material(
                  color: const Color(0xFFFFFCF5),
                  shape: const CircleBorder(),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppAssets.notificationIcon,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: vs(16)),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for recipes',
                      prefixIcon: UnconstrainedBox(
                        child: SvgPicture.asset(
                          AppAssets.searchIcon,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: s(16)),
                Material(
                  shape: CircleBorder(
                    side: Theme.of(context)
                        .inputDecorationTheme
                        .border!
                        .borderSide,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppAssets.settingsIcon,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
