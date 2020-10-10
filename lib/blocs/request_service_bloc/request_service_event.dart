part of 'request_service_bloc.dart';

abstract class RequestServiceEvent extends Equatable {
  const RequestServiceEvent();

  @override
  List<Object> get props => [];
}

class SendRequestServiceEvent extends RequestServiceEvent {
  final RequestServiceBody requestServiceBody;

  SendRequestServiceEvent(this.requestServiceBody);
}
