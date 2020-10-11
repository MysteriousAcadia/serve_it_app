part of 'select_community_bloc.dart';

abstract class SelectCommunityState extends Equatable {
  const SelectCommunityState();

  @override
  List<Object> get props => [];
}

class SelectCommunityLoading extends SelectCommunityState {}

class SelectCommunityInitial extends SelectCommunityState {}

class SelectCommunityLoaded extends SelectCommunityState {
  final List<Community> communities;

  SelectCommunityLoaded(this.communities);
}

class SelectCommunitySuccess extends SelectCommunityState {}
