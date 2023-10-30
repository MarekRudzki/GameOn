import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridViewTile extends StatelessWidget {
  final String name;
  final String url;
  final int popularity;

  const GridViewTile({
    super.key,
    required this.name,
    required this.url,
    required this.popularity,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, //TODO
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: url,
              placeholder: (context, url) => Image.asset(
                'assets/loading.gif',
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                size: 80,
                color: Colors.red,
              ),
              imageBuilder: (context, imageProvider) => Column(
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.height) / 7,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(192, 105, 103, 103),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                name,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$popularity',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 7),
                              Image.asset(
                                'assets/rating_stars.png',
                                height: 35,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
