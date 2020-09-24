part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {}

class ProfileUploaded extends ProfileState {}

class ProfileLoaded extends ProfileState {
  String name, address, picURL;
  File picture;
  ProfileLoaded({name, address, picURL, picture});
}
