part of 'receive_page_bloc.dart';

abstract class ReceivePageEvent extends Equatable {
  const ReceivePageEvent();

  @override
  List<Object> get props => [];
}
class ReceivePageReload extends ReceivePageEvent{}
