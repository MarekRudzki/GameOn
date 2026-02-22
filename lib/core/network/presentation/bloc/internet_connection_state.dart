part of 'internet_connection_bloc.dart';

sealed class InternetConnectionState extends Equatable {
  const InternetConnectionState();

  @override
  List<Object?> get props => [];
}

final class InternetConnectionInitial extends InternetConnectionState {
  const InternetConnectionInitial();
}

final class InternetConnectionConnected extends InternetConnectionState {
  const InternetConnectionConnected();
}

final class InternetConnectionDisconnected extends InternetConnectionState {
  const InternetConnectionDisconnected();
}