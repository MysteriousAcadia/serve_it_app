import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'receive_page_event.dart';
part 'receive_page_state.dart';

class ReceivePageBloc extends Bloc<ReceivePageEvent, ReceivePageState> {
  ReceivePageBloc() : super(ReceivePageInitial());

  @override
  Stream<ReceivePageState> mapEventToState(
    ReceivePageEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
