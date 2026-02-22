// Dart imports:
import 'dart:async';

// Package imports:
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'internet_connection_event.dart';
part 'internet_connection_state.dart';

class InternetConnectionBloc extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  final InternetConnectionChecker _connectionChecker;
  StreamSubscription<InternetConnectionStatus>? _subscription;

  InternetConnectionBloc({required InternetConnectionChecker connectionChecker})
      : _connectionChecker = connectionChecker,
        super(const InternetConnectionInitial()) {
    on<InternetConnectionStarted>(_onStarted);
    on<InternetConnectionStatusChanged>(_onStatusChanged);
  }

  Future<void> _onStarted(
    InternetConnectionStarted event,
    Emitter<InternetConnectionState> emit,
  ) async {
    _subscription = _connectionChecker.onStatusChange.listen((status) {
      add(InternetConnectionStatusChanged(status: status));
    });

    final hasInternet = await _connectionChecker.hasConnection;
    emit(
      hasInternet
          ? const InternetConnectionConnected()
          : const InternetConnectionDisconnected(),
    );
  }

  void _onStatusChanged(
    InternetConnectionStatusChanged event,
    Emitter<InternetConnectionState> emit,
  ) {
    emit(
      event.status == InternetConnectionStatus.connected
          ? const InternetConnectionConnected()
          : const InternetConnectionDisconnected(),
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}