import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/scaling.dart';

class HomeSection extends StatelessWidget {
  final String title;
  final Widget child;

  const HomeSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: vs(24)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: s(18)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF060605),
                  fontSize: s(19),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                'See All',
                style: GoogleFonts.manrope(
                  color: const Color(0xFF60646C),
                  fontSize: s(14),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: vs(12)),
        child,
      ],
    );
  }
}
