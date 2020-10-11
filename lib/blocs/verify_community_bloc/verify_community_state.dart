part of 'verify_community_bloc.dart';

abstract class VerifyCommunityState extends Equatable {
  const VerifyCommunityState();
  
  @override
  List<Object> get props => [];
}

class VerifyCommunityInitial extends VerifyCommunityState {}

class VerifyServiceInitial extends VerifyCommunityState {}

class VerifyCommunityFileAdded extends VerifyCommunityState {}

class VerifyCommunityFileUploading extends VerifyCommunityState{}

class VerifyCommunitySuccess extends VerifyCommunityState {}
