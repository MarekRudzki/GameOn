part of 'internet_connection_bloc.dart';

abstract class InternetConnectionState extends Equatable {
  const InternetConnectionState();

  @override
  List<Object?> get props => [];
}

class InternetConnectionInitial extends InternetConnectionState {
  const InternetConnectionInitial();
}

class InternetConnectionConnected extends InternetConnectionState {
  const InternetConnectionConnected();
}

class InternetConnectionDisconnected extends InternetConnectionState {
  const InternetConnectionDisconnected();
}