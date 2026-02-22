// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:gameon/core/network/presentation/bloc/internet_connection_bloc.dart';
import 'package:gameon/core/network/presentation/widgets/no_network.dart';

class NetworkListenerWidget extends StatelessWidget {
  final Widget child;

  const NetworkListenerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetConnectionBloc, InternetConnectionState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: state is InternetConnectionConnected ? child : const NoNetwork(),
        );
      },
    );
  }
}