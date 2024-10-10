import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_conn_event.dart';
part 'server_conn_state.dart';
part 'server_conn_bloc.freezed.dart';

class ServerConnBloc extends Bloc<ServerConnEvent, ServerConnState> {
  ServerConnBloc() : super(_Initial()) {
    on<ServerConnEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
