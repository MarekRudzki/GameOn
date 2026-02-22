part of 'internet_connection_bloc.dart';

sealed class InternetConnectionEvent extends Equatable {
  const InternetConnectionEvent();

  @override
  List<Object?> get props => [];
}

final class InternetConnectionStarted extends InternetConnectionEvent {
  const InternetConnectionStarted();
}

final class InternetConnectionStatusChanged extends InternetConnectionEvent {
  final InternetConnectionStatus status;

  const InternetConnectionStatusChanged({required this.status});

  @override
  List<Object?> get props => [status];
}
