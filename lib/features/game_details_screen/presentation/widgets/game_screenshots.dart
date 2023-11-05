import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  bool isAutoplay = true;
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<int> carouselItems = [];
    for (int i = 0; i < widget.screenshots.length; i++) {
      carouselItems.add(i);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.sizeOf(context).height * 0.23,
          autoPlay: isAutoplay,
          onPageChanged: (index, reason) {
            imageIndex = index;
          },
        ),
        items: carouselItems.map(
          (i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      isAutoplay = false;
                    });
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        insetPadding: const EdgeInsets.symmetric(horizontal: 5),
                        backgroundColor: Colors.black.withOpacity(0.3),
                        child: PhotoView(
                          imageProvider: NetworkImage(
                            widget.screenshots[imageIndex],
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
                        isAutoplay = true;
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
