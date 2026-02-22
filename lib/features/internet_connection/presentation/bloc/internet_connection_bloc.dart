import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:equatable/equatable.dart';

part 'internet_connection_event.dart';
part 'internet_connection_state.dart';

class InternetConnectionBloc extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  final InternetConnectionChecker connectionChecker;
  late StreamSubscription<InternetConnectionStatus> _subscription;

  InternetConnectionBloc({required this.connectionChecker})
      : super(const InternetConnectionInitial()) {
    on<InternetConnectionStarted>(_onStarted);
    on<InternetConnectionStatusChanged>(_onStatusChanged);
  }

  Future<void> _onStarted(
    InternetConnectionStarted event,
    Emitter<InternetConnectionState> emit,
  ) async {
    _subscription = connectionChecker.onStatusChange.listen((status) {
      add(InternetConnectionStatusChanged(status: status));
    });

    // Sprawdź obecny status
    final hasInternet = await connectionChecker.hasConnection;
    emit(
      hasInternet ? const InternetConnectionConnected() : const InternetConnectionDisconnected(),
    );
  }

  Future<void> _onStatusChanged(
    InternetConnectionStatusChanged event,
    Emitter<InternetConnectionState> emit,
  ) async {
    if (event.status == InternetConnectionStatus.connected) {
      emit(const InternetConnectionConnected());
    } else {
      emit(const InternetConnectionDisconnected());
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
