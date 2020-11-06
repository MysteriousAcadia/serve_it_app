part of 'provide_page_bloc.dart';

abstract class ProvidePageState extends Equatable {
  const ProvidePageState();

  @override
  List<Object> get props => [];
}

class ProvidePageInitial extends ProvidePageState {}

class ProvidePageLoading extends ProvidePageState {}

class ProvidePageSuccess extends ProvidePageState {
  final List<VerifyService> services;
  // final List<VerifyService> services;
  // final List<ServiceProvider> scheduled;
  final List<ServiceRecents> scheduled;
  // final List<ServiceProvider> offers;
  final List<ServiceRecents> offers;

  ProvidePageSuccess(this.services, this.scheduled, this.offers);

}
class ProvidePageFailure extends ProvidePageState{}
