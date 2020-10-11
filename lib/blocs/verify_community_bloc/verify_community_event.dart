part of 'verify_community_bloc.dart';

abstract class VerifyCommunityEvent extends Equatable {
  const VerifyCommunityEvent();

  @override
  List<Object> get props => [];
}

class UploadDocumentEvent extends VerifyCommunityEvent {
  final String serviceId;

  UploadDocumentEvent(this.serviceId);
}

class AddDocumentEvent extends VerifyCommunityEvent {
  final File file;

  AddDocumentEvent(this.file);
}