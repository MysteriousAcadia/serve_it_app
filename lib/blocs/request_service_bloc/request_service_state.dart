part of 'request_service_bloc.dart';

abstract class RequestServiceState  {
  const RequestServiceState();

 
}

class RequestServiceInitial extends RequestServiceState {}

class RequestServiceSuccess extends RequestServiceState {}

class RequestServiceLoading extends RequestServiceState {}

class RequestServiceError extends RequestServiceState {}

class UpdateServiceStatus extends RequestServiceState {}
