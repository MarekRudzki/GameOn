import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gameon/features/internet_connection/presentation/widgets/no_network.dart';
import 'package:gameon/features/internet_connection/presentation/bloc/internet_connection_bloc.dart';

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
