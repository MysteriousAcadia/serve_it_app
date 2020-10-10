part of 'verify_service_bloc.dart';

abstract class VerifyServiceState extends Equatable {
  const VerifyServiceState();

  @override
  List<Object> get props => [];
}

class VerifyServiceInitial extends VerifyServiceState {}

class VerifyServiceFileAdded extends VerifyServiceState {}

class VerifyServiceSuccess extends VerifyServiceState {}
