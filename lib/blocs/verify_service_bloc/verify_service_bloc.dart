import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'verify_service_event.dart';
part 'verify_service_state.dart';

class VerifyServiceBloc extends Bloc<VerifyServiceEvent, VerifyServiceState> {
  VerifyServiceBloc() : super(VerifyServiceInitial());
  File document;

  @override
  Stream<VerifyServiceState> mapEventToState(
    VerifyServiceEvent event,
  ) async* {
    if (event is UploadDocumentEvent) {
      document = event.file;
    }
  }
}
