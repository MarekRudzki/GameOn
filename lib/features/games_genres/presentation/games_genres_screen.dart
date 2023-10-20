import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/games_genres/presentation/bloc/games_genres/games_genres_bloc.dart';

class GamesGenresScreen extends StatelessWidget {
  const GamesGenresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double tileHeight = (MediaQuery.of(context).size.height) / 7;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 43, 42, 48),
          title: const Text(
            'Games Genres',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
            ),
          ),
          centerTitle: true,
          actions: [
            const DataProviderButton(),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 43, 42, 48),
        body: BlocBuilder<GamesGenresBloc, GamesGenresState>(
          builder: (context, state) {
            if (state is GameGenreSuccess) {
              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1 / 0.8,
                ),
                children: List.generate(
                  19,
                  (index) => Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: state.gameGenreModels[index].url,
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
                                height: tileHeight,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color:
                                      const Color.fromARGB(192, 187, 182, 182),
                                  child: Center(
                                    child: Text(
                                      state.gameGenreModels[index].name
                                          .replaceAll(
                                              'Massively Multiplayer', 'MMO'),
                                      style: const TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
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
                  ),
                ),
              );
            } else if (state is GamesGenresLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
