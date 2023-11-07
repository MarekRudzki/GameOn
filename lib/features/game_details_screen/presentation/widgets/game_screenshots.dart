import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gameon/utils/custom_theme.dart';
import 'package:photo_view/photo_view.dart';

class GameScreenshots extends StatefulWidget {
  final List<String> screenshots;

  const GameScreenshots({
    super.key,
    required this.screenshots,
  });

  @override
  State<GameScreenshots> createState() => _GameScreenshotsState();
}

class _GameScreenshotsState extends State<GameScreenshots> {
  bool _isAutoplay = true;
  int _imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<int> _carouselItems = [];
    for (int i = 0; i < widget.screenshots.length; i++) {
      _carouselItems.add(i);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.sizeOf(context).height * 0.23,
          autoPlay: _isAutoplay,
          onPageChanged: (index, reason) {
            _imageIndex = index;
          },
        ),
        items: _carouselItems.map(
          (i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _isAutoplay = false;
                    });
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        insetPadding: const EdgeInsets.symmetric(horizontal: 5),
                        backgroundColor: CustomTheme.theme.colorScheme.tertiary
                            .withOpacity(0.3),
                        child: PhotoView(
                          imageProvider: NetworkImage(
                            widget.screenshots[_imageIndex],
                          ),
                          minScale: PhotoViewComputedScale.contained,
                          maxScale: PhotoViewComputedScale.covered * 2,
                          controller: PhotoViewController(),
                          tightMode: true,
                          backgroundDecoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ).then((_) {
                      setState(() {
                        _isAutoplay = true;
                      });
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 5,
                    ),
                    child: Image.network(
                      widget.screenshots[i],
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
