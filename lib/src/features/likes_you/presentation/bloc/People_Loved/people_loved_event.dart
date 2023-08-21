// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'people_loved_bloc.dart';

@immutable
abstract class PeopleLovedEvent {}

class PeopleLovedList extends PeopleLovedEvent {}

class AddPeopleToLovedList extends PeopleLovedEvent {
  final User user;

  AddPeopleToLovedList({
    required this.user,
  });
}
