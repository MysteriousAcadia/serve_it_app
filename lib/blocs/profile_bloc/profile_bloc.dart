import 'dart:async';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:path/path.dart' as Path;
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:serveit/models/request/update_profile_body.dart';
import 'package:serveit/services/localstorage_service.dart';
import 'package:serveit/services/serveit_api_service.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoaded(name: "", address: "", picURL: ""));
  LocalStorageService localStorageService;
  void init(LocalStorageService localStorageService) {
    this.localStorageService = localStorageService;
  }

  String name = "";
  String locality = "";
  String picUrl = "";
  String phoneNo = "";
  File picture;
  Position position;

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is GetProfile) {
      yield ProfileLoaded(
          name: name,
          address: locality,
          picURL: picUrl,
          picture: picture,
          phoneNo: phoneNo);
    } else if (event is ProfileUpdate) {
      if (event.picture != null) {
        picture = event.picture;
      }
      if (event.locality != null) {
        locality = event.locality;
      }
      if (event.name != null) {
        name = event.name;
      }
      if (event.phone != null) {
        phoneNo = event.phone;
      }
      yield ProfileLoaded(
          name: name, address: locality, picURL: picUrl, picture: picture);
    } else if (event is ProfileUpload) {
      yield ProfileLoadingState();
      if (picture != null) {
        StorageReference storageReference = FirebaseStorage.instance
            .ref()
            .child('profile_picture/${Path.basename(picture.path)}}');
        StorageUploadTask uploadTask = storageReference.putFile(picture);
        await uploadTask.onComplete;
        print('File Uploaded');
        picUrl = await storageReference.getDownloadURL();
      }
      UpdateProfileBody body = UpdateProfileBody(
          name: name, address: locality, mobile: phoneNo, profilePic: picUrl);
      UserApiClient client = UserApiClient(httpClient: http.Client());
      client.updateProfile(body, localStorageService.authToken.token);
      yield ProfileUploaded();
      yield ProfileLoaded(name: name, address: locality, picURL: picUrl);
    } else if (event is GetLocation) {
      LocationPermission permission = await checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await requestPermission();
      }
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        position =
            await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      }
    }
  }
}
