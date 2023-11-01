import 'package:el_tooltip/el_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:gameon/features/game_details_screen/data/models/user_rating_model.dart';

class UserRating extends StatelessWidget {
  final UserRatingModel userRating;
  final int reviewsCount;

  const UserRating({
    super.key,
    required this.userRating,
    required this.reviewsCount,
  });

  @override
  Widget build(BuildContext context) {
    final double barWidth = MediaQuery.of(context).size.width - 28;
    final double exceptionalWidth =
        barWidth * ((userRating.exceptional ?? 0) / reviewsCount);
    final double recommendedWidth =
        barWidth * ((userRating.recommended ?? 0) / reviewsCount);
    final double mehWidth = barWidth * ((userRating.meh ?? 0) / reviewsCount);
    final double skipWidth = barWidth * ((userRating.skip ?? 0) / reviewsCount);

    return Column(
      children: [
        const Text(
          'Players rating:',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 40,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: ElTooltip(
                      showChildAboveOverlay: false,
                      content: const Text('Exceptional'),
                      modalConfiguration: const ModalConfiguration(
                        opacity: 0.5,
                      ),
                      child: Container(
                        width: exceptionalWidth,
                        height: 40,
                        color: const Color.fromARGB(255, 104, 177, 49),
                        child: const Center(
                          child: Text(
                            '🤩',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: exceptionalWidth,
                    child: ElTooltip(
                      content: const Text('Recommended'),
                      showChildAboveOverlay: false,
                      modalConfiguration: const ModalConfiguration(
                        opacity: 0.5,
                      ),
                      child: Container(
                        width: recommendedWidth,
                        height: 40,
                        color: const Color.fromARGB(255, 81, 114, 215),
                        child: const Center(
                          child: Text(
                            '😁',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: exceptionalWidth + recommendedWidth,
                    child: ElTooltip(
                      content: const Text('Meh'),
                      showChildAboveOverlay: false,
                      modalConfiguration: const ModalConfiguration(
                        opacity: 0.5,
                      ),
                      child: Container(
                        width: mehWidth,
                        height: 40,
                        color: const Color.fromARGB(255, 248, 156, 59),
                        child: const Center(
                          child: Text(
                            '😐',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: exceptionalWidth + recommendedWidth + mehWidth,
                    child: ElTooltip(
                      content: const Text('Skip'),
                      showChildAboveOverlay: false,
                      modalConfiguration: const ModalConfiguration(
                        opacity: 0.5,
                      ),
                      child: Container(
                        width: skipWidth,
                        height: 40,
                        color: const Color.fromARGB(255, 249, 64, 78),
                        child: const Center(
                          child: Text(
                            '😕',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 127, 124, 124),
          endIndent: 25,
          indent: 25,
          thickness: 1,
        ),
      ],
    );
  }
}
