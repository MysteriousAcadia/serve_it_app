part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

 class ProfileUpdate extends ProfileEvent {
  final String name, address;
  final File picture;

  ProfileUpdate({this.name, this.address, this.picture});
}

 class ProfileUpload extends ProfileEvent {
  // final String name, address, picURL;
  // ProfileUpload({this.name, this.address, this.picURL});
}

 class GetProfile extends ProfileEvent {}
