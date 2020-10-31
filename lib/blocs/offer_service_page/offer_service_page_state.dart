part of 'offer_service_page_bloc.dart';

abstract class OfferServicePageState  {
  const OfferServicePageState();
  
  @override
  List<Object> get props => [];
}

class OfferServicePageLoading extends OfferServicePageState {}
class OfferServicePageAccepted extends OfferServicePageState {}
class OfferServicePageRejected extends OfferServicePageState {}
class OfferServicePageMarkedAsDone extends OfferServicePageState {}
