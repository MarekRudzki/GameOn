// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:gameon/common_widgets/data_provider_button.dart';
import 'package:gameon/config/theme/custom_theme.dart';
import 'package:gameon/features/genres/presentation/bloc/genres_bloc/genres_bloc.dart';
import 'package:gameon/features/genres/presentation/widgets/genre_tile.dart';
import 'package:gameon/generated/l10n/app_localizations.dart';

class GenresScreen extends StatelessWidget {
  const GenresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: CustomTheme.theme.colorScheme.surface,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            elevation: 5,
            backgroundColor: CustomTheme.theme.colorScheme.onSurface,
            title: Text(
              l10n.genres,
              style: TextStyle(color: CustomTheme.theme.colorScheme.primary, fontSize: 21),
            ),
            centerTitle: true,
            actions: const [DataProviderButton()],
            forceElevated: innerBoxIsScrolled,
          ),
        ],
        body: BlocBuilder<GenresBloc, GenresState>(
          builder: (context, state) {
            return switch (state) {
              GenresSuccess() => _buildSuccessState(state),
              GenresLoading() => const Center(child: CircularProgressIndicator()),
              GenresError() => _buildErrorState(state.message, l10n),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }

  Widget _buildSuccessState(GenresSuccess state) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          childAspectRatio: 1 / 0.8,
        ),
        itemCount: state.gameGenreModels.length,
        itemBuilder: (context, index) => GenreTile(
          genreId: state.gameGenreModels[index].id,
          genreName: state.gameGenreModels[index].name,
          genreUrl: state.gameGenreModels[index].url,
        ),
      ),
    );
  }

  Widget _buildErrorState(String message, AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: CustomTheme.theme.colorScheme.error),
          const SizedBox(height: 16),
          Text(
            l10n.errorLoadingGenres,
            style: TextStyle(fontSize: 18, color: CustomTheme.theme.colorScheme.primary),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: CustomTheme.theme.colorScheme.primary.withAlpha(179),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
