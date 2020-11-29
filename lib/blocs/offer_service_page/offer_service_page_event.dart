part of 'offer_service_page_bloc.dart';

abstract class OfferServicePageEvent {
  const OfferServicePageEvent();

  @override
  List<Object> get props => [];
}

abstract class OfferServiceAcceptEvent extends OfferServicePageEvent {
  final String serviceID;

  OfferServiceAcceptEvent(this.serviceID);
}

abstract class OfferServiceMarkAsDoneEvent extends OfferServicePageEvent {
   final String serviceID;

  OfferServiceMarkAsDoneEvent(this.serviceID);
}

abstract class OfferServiceRejectEvent extends OfferServicePageEvent {
   final String serviceID;

  OfferServiceRejectEvent(this.serviceID);
}
