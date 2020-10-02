part of 'receive_page_bloc.dart';

abstract class ReceivePageState extends Equatable {
  const ReceivePageState();

  @override
  List<Object> get props => [];
}

class ReceivePageInitial extends ReceivePageState {}

class ReceivePageLoading extends ReceivePageState {}

class ReceivePageSuccess extends ReceivePageState {
  final List<Service> services;
  final List<Service> recents;

  ReceivePageSuccess(this.services, this.recents);
}

class ReceivePageFailure extends ReceivePageState {}
