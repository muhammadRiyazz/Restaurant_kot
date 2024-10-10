import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'server_conn_event.dart';
part 'server_conn_state.dart';
part 'server_conn_bloc.freezed.dart';

class ServerConnBloc extends Bloc<ServerConnEvent, ServerConnState> {
  ServerConnBloc() : super(ServerConnState.initial()) {
    on<Passcode>((event, emit) async {
      log('passcose event');
      emit(state.copyWith(
          isLoading: true, passcode: false, passcodeErrorMsg: null));
      final response =
          await http.get(Uri.parse('https://www.ballast.in/passcode.txt'));

      if (response.statusCode == 200) {
        if (event.passcodepin.toString() == response.body.toString()) {
          log('correct pin');
          emit(state.copyWith(isLoading: false, passcode: true));
        } else {
          emit(state.copyWith(
              isLoading: false,
              passcode: false,
              passcodeErrorMsg: 'Incorrect Passcode'));
          log('incorrect pin');
        }
      } else {
        emit(state.copyWith(isLoading: false, passcode: false));
        throw Exception('Failed to load text');
      }
    });
  }
}
