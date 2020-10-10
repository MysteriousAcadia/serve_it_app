part of 'provide_page_bloc.dart';

abstract class ProvidePageEvent extends Equatable {
  const ProvidePageEvent();

  @override
  List<Object> get props => [];
}

class ProvidePageReload extends ProvidePageEvent {}