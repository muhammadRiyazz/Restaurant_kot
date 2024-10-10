part of 'server_conn_bloc.dart';

@freezed
class ServerConnState with _$ServerConnState {
  factory ServerConnState({
    required bool isLoading,
    required bool passcode,
    String? passcodeErrorMsg,
  }) = _ServerConnState;
  factory ServerConnState.initial() {
    return ServerConnState(
        isLoading: false, passcode: false, passcodeErrorMsg: null);
  }
}
