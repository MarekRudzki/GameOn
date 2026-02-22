part of 'internet_connection_bloc.dart';

abstract class InternetConnectionEvent extends Equatable {
  const InternetConnectionEvent();

  @override
  List<Object?> get props => [];
}

class InternetConnectionStarted extends InternetConnectionEvent {
  const InternetConnectionStarted();
}

class InternetConnectionStatusChanged extends InternetConnectionEvent {
  final InternetConnectionStatus status;

  const InternetConnectionStatusChanged({required this.status});

  @override
  List<Object?> get props => [status];
}
