import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:serveit/services/localstorage_service.dart';

part 'verify_community_event.dart';
part 'verify_community_state.dart';

class VerifyCommunityBloc
    extends Bloc<VerifyCommunityEvent, VerifyCommunityState> {
  VerifyCommunityBloc(this.localStorageService)
      : super(VerifyCommunityInitial());
  File document;
  final LocalStorageService localStorageService;

  @override
  Stream<VerifyCommunityState> mapEventToState(
    VerifyCommunityEvent event,
  ) async* {
    if (event is AddDocumentEvent) {
      document = event.file;
      yield VerifyCommunityFileAdded();
    } else if (event is UploadDocumentEvent) {
      yield VerifyCommunityFileUploading();
      if (document != null) {
        StorageReference storageReference = FirebaseStorage.instance
            .ref()
            .child('verify_community/${Path.basename(document.path)}}');
        StorageUploadTask uploadTask = storageReference.putFile(document);
        await uploadTask.onComplete;
        print('File Uploaded');
        var url = await storageReference.getDownloadURL();
        //TODO send document for verification
        yield VerifyCommunitySuccess();
      }
    }
  }
}