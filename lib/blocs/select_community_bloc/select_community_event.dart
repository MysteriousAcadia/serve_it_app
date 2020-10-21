part of 'select_community_bloc.dart';

abstract class SelectCommunityEvent extends Equatable {
  const SelectCommunityEvent();

  @override
  List<Object> get props => [];
}

class FetchCommunitiesEvent extends SelectCommunityEvent {
  final String query;

  FetchCommunitiesEvent(this.query);
}

class AddCommunityEvent extends SelectCommunityEvent {
  final String community_id;

  AddCommunityEvent(this.community_id);
}
