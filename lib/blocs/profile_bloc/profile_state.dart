part of 'profile_bloc.dart';

abstract class ProfileState {
  String nameError, phoneError, localityError;

  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {}

class ProfileUploaded extends ProfileState {}

class ProfileError extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String name, address, picURL, phoneNo;
  final File picture;

  ProfileLoaded(
      {this.name, this.address, this.picURL, this.phoneNo, this.picture});
}
