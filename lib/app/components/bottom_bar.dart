import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assets.dart';
import '../scaling.dart';
import '../utils/strings.dart';

class BottomBar extends StatefulWidget {
  final BottomBarItem? selected;
  final Function(BottomBarItem)? onSelected;

  const BottomBar({super.key, this.selected, this.onSelected});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  static const _items = [
    (BottomBarItem.home, AppAssets.homeIcon),
    (BottomBarItem.favourite, AppAssets.favouriteIcon),
    (BottomBarItem.bookings, AppAssets.bookingsIcon),
    (BottomBarItem.message, AppAssets.messageIcon),
    (BottomBarItem.account, AppAssets.accountIcon),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onSurface.withOpacity(0.1),
            blurRadius: s(10),
            offset: Offset(0, -s(2)),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _items.map(
          (element) {
            final selected = widget.selected == element.$1;
            final color = selected
                ? theme.colorScheme.primary
                : theme.textTheme.bodyLarge?.color;
            return GestureDetector(
              onTap: () => widget.onSelected?.call(element.$1),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: vs(12)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      element.$2,
                      colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
                      width: s(24),
                      height: s(24),
                    ),
                    SizedBox(height: vs(2)),
                    Text(
                      element.$1.name.capitalize(),
                      style: TextStyle(
                        color: color,
                        fontWeight:
                            selected ? FontWeight.w700 : FontWeight.w400,
                        fontSize: s(10),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

enum BottomBarItem {
  home,
  favourite,
  bookings,
  message,
  account,
}
