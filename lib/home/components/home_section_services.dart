import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/assets.dart';
import '../../app/scaling.dart';
import 'home_section.dart';

class HomeSectionServices extends StatelessWidget {
  const HomeSectionServices({super.key});

  static const _services = [
    ('Chefs', AppAssets.userIcon, Color(0xFF6E56CF)),
    ('Photographer', AppAssets.cameraIcon, Color(0xFFE80E00)),
    ('Catering', AppAssets.userIcon, Color(0xFFE87205)),
    ('Marquee Hire', AppAssets.directionsIcon, Color(0xFF726D00)),
    ('Venue Hire', AppAssets.venueIcon, Color(0xFF274F00)),
    ('MC & Host', AppAssets.userIcon, Color(0xFF008C21)),
    ('DJ', AppAssets.diskIcon, Color(0xFF005C57)),
    ('Musicians', AppAssets.microphoneIcon, Color(0xFF66006E)),
  ];

  static const _columns = 4;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: HomeSection(
        title: 'Services',
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: s(18)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _services
                .slices(_columns)
                .mapIndexed((index, row) {
                  return [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: row.map((item) {
                        return Column(
                          children: [
                            Container(
                              width: s(64),
                              height: s(64),
                              decoration: BoxDecoration(
                                color: item.$3.withOpacity(.1),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  item.$2,
                                  width: s(24),
                                  height: s(24),
                                  colorFilter: ColorFilter.mode(
                                    item.$3,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: vs(4)),
                            FittedBox(
                              child: Text(
                                item.$1,
                                style: TextStyle(
                                  fontSize: s(12),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                    if (index < _services.length ~/ _columns - 1)
                      SizedBox(height: vs(12)),
                  ];
                })
                .flattened
                .toList(),
          ),
        ),
      ),
    );
  }
}
