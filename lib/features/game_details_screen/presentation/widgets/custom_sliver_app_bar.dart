import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.name,
    required this.heroId,
    required this.image,
  });

  final String name;
  final String heroId;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 58, 57, 65),
      expandedHeight: height * 0.35,
      collapsedHeight: height * 0.08,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double appBarHeight = constraints.biggest.height;
          final bool isExpanded = appBarHeight > height * 0.08;
          return FlexibleSpaceBar(
            expandedTitleScale: 1.3,
            centerTitle: true,
            titlePadding: EdgeInsets.symmetric(
              horizontal: 45,
              vertical: isExpanded ? 10 : 0,
            ),
            title: Column(
              mainAxisAlignment:
                  isExpanded ? MainAxisAlignment.end : MainAxisAlignment.center,
              children: [
                Container(),
                GlowText(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                  ),
                  textAlign: TextAlign.center,
                  glowColor: Colors.black,
                  blurRadius: 10,
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(),
              ],
            ),
            background: Hero(
              tag: heroId,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const GlowIcon(
          Icons.arrow_back,
          color: Colors.white,
          glowColor: Colors.black,
          blurRadius: 5,
        ),
      ),
      actions: [
        const DataProviderButton(),
      ],
    );
  }
}
