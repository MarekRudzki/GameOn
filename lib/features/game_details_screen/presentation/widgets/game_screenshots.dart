import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GameScreenshots extends StatelessWidget {
  final List<String> screenshots;

  const GameScreenshots({
    super.key,
    required this.screenshots,
  });

  @override
  Widget build(BuildContext context) {
    final List<int> carouselItems = [];
    for (int i = 0; i < screenshots.length; i++) {
      carouselItems.add(i);
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: 170,
        autoPlay: true,
      ),
      items: carouselItems.map(
        (i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5,
                ),
                child: Image.network(
                  screenshots[i],
                  fit: BoxFit.fill,
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
