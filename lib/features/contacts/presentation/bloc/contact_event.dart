import 'package:equatable/equatable.dart';

abstract class ContactEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadContacts extends ContactEvent {}

class SearchContacts extends ContactEvent {
  final String query;

  SearchContacts(this.query);

  @override
  List<Object?> get props => [query];
}
