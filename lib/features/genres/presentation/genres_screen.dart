import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/genres/presentation/bloc/genres/genres_bloc.dart';
import 'package:gameon/features/genres/presentation/widgets/genre_tile.dart';

class GenresScreen extends StatelessWidget {
  const GenresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double tileHeight = (MediaQuery.of(context).size.height) / 7;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: const Color.fromARGB(255, 58, 57, 65),
          title: const Text(
            'Genres',
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
        body: BlocBuilder<GenresBloc, GenresState>(
          builder: (context, state) {
            if (state is GenresSuccess) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1 / 0.8,
                  ),
                  children: List.generate(
                    19,
                    (index) => GenreTile(
                      tileHeight: tileHeight,
                      genreId: state.gameGenreModels[index].id,
                      genreName: state.gameGenreModels[index].name,
                      genreUrl: state.gameGenreModels[index].url,
                    ),
                  ),
                ),
              );
            } else if (state is GenresLoading) {
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
