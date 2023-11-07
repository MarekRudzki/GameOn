import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/features/genres/presentation/bloc/genres_bloc/genres_bloc.dart';
import 'package:gameon/features/genres/presentation/widgets/genre_tile.dart';
import 'package:gameon/utils/custom_theme.dart';
import 'package:nil/nil.dart';

class GenresScreen extends StatelessWidget {
  const GenresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.theme.colorScheme.background,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (
          BuildContext context,
          bool innerBoxIsScrolled,
        ) {
          return [
            SliverAppBar(
              elevation: 5,
              backgroundColor: CustomTheme.theme.colorScheme.onBackground,
              title: Text(
                'Genres',
                style: TextStyle(
                  color: CustomTheme.theme.colorScheme.primary,
                  fontSize: 21,
                ),
              ),
              centerTitle: true,
              actions: [
                const DataProviderButton(),
              ],
              forceElevated: innerBoxIsScrolled,
            ),
          ];
        },
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
              return nil;
            }
          },
        ),
      ),
    );
  }
}
