import 'package:boxy/boxy.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/assets.dart';
import '../../app/scaling.dart';

class HomeCard extends StatelessWidget {
  final dynamic data;

  const HomeCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 274 / 203,
      child: Column(
        children: [
          Expanded(
            child: Material(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(s(9)),
              ),
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(s(9)),
                child: CustomBoxy(
                  delegate: _HomeCardDelegate(),
                  children: [
                    BoxyId(id: #top, child: top),
                    BoxyId(id: #avatar, child: avatar),
                    BoxyId(id: #description, child: description),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 3),
        ],
      ),
    );
  }

  Widget get top {
    return AspectRatio(
      aspectRatio: 274 / 119,
      child: Stack(
        children: [
          CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            imageUrl: data['background_image'],
            fit: BoxFit.cover,
          ),
          Positioned(
            top: vs(14),
            left: s(14),
            right: s(14),
            bottom: vs(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: s(8),
                        vertical: vs(2),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(s(30)),
                      ),
                      child: Text(
                        data['location'],
                        style: TextStyle(fontSize: s(10)),
                      ),
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.white,
                      size: s(18),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  data['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: s(12),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Builder(builder: (context) {
                      return Icon(
                        Icons.star_rate_rounded,
                        color: Theme.of(context).colorScheme.primary,
                        size: s(12),
                      );
                    }),
                    SizedBox(width: s(4)),
                    Text(
                      data['average_review'].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: s(10),
                      ),
                    ),
                    SizedBox(width: s(4)),
                    Text(
                      '(${data['number_of_reviews']} Reviews)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: s(10),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget get avatar {
    return Builder(
      builder: (context) {
        return Container(
          width: s(48),
          height: s(48),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: s(2),
            ),
          ),
          child: Stack(
            children: [
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(9999),
                child: CachedNetworkImage(
                  imageUrl: data['avatar_image'],
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: s(10),
                  height: s(10),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1C2024),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: s(7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget get description {
    return Padding(
      padding: EdgeInsets.all(s(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              data['description'],
              style: TextStyle(
                fontSize: s(10),
              ),
            ),
          ),
          SizedBox(height: vs(8)),
          Row(
            children: [
              ...(data['tags'] as List<dynamic>)
                  .map(
                    (tag) => [
                      _Tag(title: tag),
                      const Spacer(),
                    ],
                  )
                  .flattened,
              const _Tag(title: '+ 3 More'),
            ],
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String title;

  const _Tag({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.bookingsIcon,
          width: s(8),
          height: s(8),
          colorFilter: const ColorFilter.mode(
            Color(0xFF020101),
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: s(5)),
        Text(
          title,
          style: TextStyle(
            fontSize: s(8),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _HomeCardDelegate extends BoxyDelegate {
  @override
  Size layout() {
    // Get handles
    final top = getChild(#top);
    final avatar = getChild(#avatar);
    final description = getChild(#description);
    // Layout children
    top.layout(constraints.loosen());
    avatar.layout(constraints.loosen());
    description.layout(
      constraints.loosen().copyWith(
            maxHeight: constraints.maxHeight -
                top.size.height -
                (avatar.size.height * .25),
          ),
    );
    // Position children
    top.position(Offset.zero);
    avatar.position(
      Offset(
        constraints.maxWidth - avatar.size.width - s(13),
        top.size.height - (avatar.size.height * .75),
      ),
    );
    description.position(
      Offset(0, avatar.rect.bottomLeft.dy),
    );
    return Size(
      constraints.maxWidth,
      top.size.height + description.size.height,
    );
  }
}
