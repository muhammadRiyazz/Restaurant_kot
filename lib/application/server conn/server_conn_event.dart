part of 'server_conn_bloc.dart';

@freezed
class ServerConnEvent with _$ServerConnEvent {
  const factory ServerConnEvent.passcode({
    required String passcodepin,
  }) = Passcode;
  
  }