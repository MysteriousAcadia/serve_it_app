import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:serveit/services/localstorage_service.dart';
import 'package:serveit/services/serveit_api_service.dart';
import 'package:path/path.dart' as Path;
import 'package:http/http.dart' as http;

part 'verify_service_event.dart';
part 'verify_service_state.dart';

class VerifyServiceBloc extends Bloc<VerifyServiceEvent, VerifyServiceState> {
  final LocalStorageService localStorageService;
  VerifyServiceBloc(this.localStorageService) : super(VerifyServiceInitial());
  File document;

  @override
  Stream<VerifyServiceState> mapEventToState(
    VerifyServiceEvent event,
  ) async* {
    if (event is AddDocumentEvent) {
      document = event.file;
      yield VerifyServiceFileAdded();
    } else if (event is UploadDocumentEvent) {
      if (document != null) {
        StorageReference storageReference = FirebaseStorage.instance
            .ref()
            .child('verify_service/${Path.basename(document.path)}}');
        StorageUploadTask uploadTask = storageReference.putFile(document);
        await uploadTask.onComplete;
        print('File Uploaded');
        var url = await storageReference.getDownloadURL();
        UserApiClient client = UserApiClient(
            httpClient: http.Client(),
            localStorageService: localStorageService);
        client.verifyServiceDoc(
          event.serviceId,
          localStorageService.authToken.token,
          url,
        );
        yield VerifyServiceSuccess();
      }
    }
  }
}
