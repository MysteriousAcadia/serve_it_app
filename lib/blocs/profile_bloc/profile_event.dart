part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

 class ProfileUpdate extends ProfileEvent {
  final String name, locality,phone;
  final File picture;

  ProfileUpdate({this.phone ,this.name, this.locality, this.picture});
}

 class ProfileUpload extends ProfileEvent {
  // final String name, address, picURL;
  // ProfileUpload({this.name, this.address, this.picURL});
}

 class GetProfile extends ProfileEvent {}
 class GetLocation extends ProfileEvent {}
