part of 'verify_service_bloc.dart';

abstract class VerifyServiceEvent extends Equatable {
  const VerifyServiceEvent();

  @override
  List<Object> get props => [];
}

class UploadDocumentEvent extends VerifyServiceEvent {
  final String serviceId;

  UploadDocumentEvent(this.serviceId);
}

class AddDocumentEvent extends VerifyServiceEvent {
  final File file;

  AddDocumentEvent(this.file);
}
