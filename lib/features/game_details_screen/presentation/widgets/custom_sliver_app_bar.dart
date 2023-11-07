import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/favorites/presentation/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:gameon/features/game_details_screen/presentation/widgets/favorite.dart';
import 'package:gameon/utils/custom_theme.dart';
import 'package:nil/nil.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String name;
  final String heroId;
  final ImageProvider<Object> image;
  final String url;
  final int popularity;

  const CustomSliverAppBar({
    super.key,
    required this.name,
    required this.heroId,
    required this.image,
    required this.url,
    required this.popularity,
  });

  @override
  Widget build(BuildContext context) {
    int _calculateNumberOfLines(String text) {
      final TextSpan textSpan = TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 21,
        ),
      );

      final TextPainter textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        maxLines: 5,
      );

      textPainter.layout(maxWidth: MediaQuery.sizeOf(context).width - 56 - 48);

      final int numberOfLines = textPainter.computeLineMetrics().length;
      return numberOfLines;
    }

    double _getCollapsedHeight(String text) {
      final textLines = _calculateNumberOfLines(text);
      if (textLines == 1) {
        return AppBar().preferredSize.height;
      } else if (textLines == 2) {
        return AppBar().preferredSize.height + (10 * textLines);
      } else {
        return AppBar().preferredSize.height + (15 * textLines);
      }
    }

    final double _height = MediaQuery.sizeOf(context).height;
    return SliverAppBar(
      backgroundColor: CustomTheme.theme.colorScheme.onBackground,
      expandedHeight: _height * 0.35,
      collapsedHeight: _getCollapsedHeight(name),
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double _appBarHeight = constraints.biggest.height;
          final bool _isExpanded = _appBarHeight > _height * 0.1;
          final bool _showFavorite = _appBarHeight > _height * 0.30;
          return FlexibleSpaceBar(
            expandedTitleScale: 1.3,
            centerTitle: true,
            titlePadding: EdgeInsets.symmetric(
              horizontal: 45,
              vertical: _isExpanded ? 10 : 0,
            ),
            title: Column(
              mainAxisAlignment: _isExpanded
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.center,
              children: [
                Container(),
                GlowText(
                  name,
                  style: TextStyle(
                    color: CustomTheme.theme.colorScheme.primary,
                    fontSize: 21,
                  ),
                  textAlign: TextAlign.center,
                  glowColor: CustomTheme.theme.colorScheme.tertiary,
                  blurRadius: 10,
                  softWrap: true,
                  maxLines: _isExpanded ? 3 : 2,
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
                child: _showFavorite
                    ? Favorite(
                        id: int.parse(heroId.substring(0, heroId.indexOf('_'))),
                        name: name,
                        url: url,
                        popularity: popularity,
                      )
                    : nil,
              ),
            ),
          );
        },
      ),
      leading: IconButton(
        onPressed: () {
          context.read<FavoritesBloc>().add(FavoritesRequested());
          Navigator.of(context).pop();
        },
        icon: GlowIcon(
          Icons.arrow_back,
          color: CustomTheme.theme.colorScheme.primary,
          glowColor: CustomTheme.theme.colorScheme.tertiary,
          blurRadius: 5,
        ),
      ),
      actions: [
        const DataProviderButton(),
      ],
    );
  }
}
