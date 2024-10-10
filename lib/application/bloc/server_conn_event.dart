part of 'server_conn_bloc.dart';

@freezed
class ServerConnEvent with _$ServerConnEvent {
  const factory ServerConnEvent.started() = _Started;
}