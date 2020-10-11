import 'dart:async';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:path/path.dart' as Path;
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:serveit/models/adress.dart';
import 'package:serveit/models/request/update_profile_body.dart';
import 'package:serveit/services/localstorage_service.dart';
import 'package:serveit/services/serveit_api_service.dart';
import 'package:serveit/services/validator.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.localStorageService)
      : super(ProfileLoaded(name: "", address: "", picURL: ""));
  final LocalStorageService localStorageService;

  String name = "";
  String locality = "";
  String latitude = "";
  String longitude = "";
  String picUrl = "";
  String phoneNo = "";
  File picture;
  bool activeCheck = false;
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
        print("Picture got updated");
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
      if (activeCheck) {
        ProfileLoaded state = ProfileLoaded(
            name: name, address: locality, picURL: picUrl, picture: picture);
        state.phoneError = validateMobile(phoneNo);
        state.localityError = validateName(locality);
        state.nameError = validateName(name);
        yield state;
      } else {
        yield ProfileLoaded(
            name: name, address: locality, picURL: picUrl, picture: picture);
      }

      print("someEVENT");
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
      if (validateName(name) == null &&
          validateMobile(phoneNo) == null &&
          validateName(locality) == null) {
        UpdateProfileBody body = UpdateProfileBody(
            name: name,
            address: Address(
              latitude: latitude,
              longitude: longitude,
              locality: locality,
            ),
            mobile: phoneNo,
            profilePic: picUrl);
        UserApiClient client = UserApiClient(
            httpClient: http.Client(),
            localStorageService: localStorageService);
        try {
          await client.updateProfile(body, localStorageService.authToken.token);
        } catch (e) {
          yield ProfileError();
        }
        yield ProfileUploaded();
      } else {
        activeCheck = true;
        ProfileLoaded state = ProfileLoaded(
            name: name, address: locality, picURL: picUrl, picture: picture);
        state.phoneError = validateMobile(phoneNo);
        state.localityError = validateName(locality);
        state.nameError = validateName(name);
        yield state;
      }
    } else if (event is GetLocation) {
      LocationPermission permission = await checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await requestPermission();
      }
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        position =
            await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        if (position != null) {
          latitude = position.latitude.toString();
          longitude = position.longitude.toString();
        }
      }
    }
  }
}
