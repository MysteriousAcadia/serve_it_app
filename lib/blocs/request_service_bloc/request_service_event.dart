part of 'request_service_bloc.dart';

abstract class RequestServiceEvent  {
  const RequestServiceEvent();
}
class UpdateData extends RequestServiceEvent{}

class SendRequestServiceEvent extends RequestServiceEvent {
  final RequestServiceBody requestServiceBody;

  SendRequestServiceEvent(this.requestServiceBody);
}
