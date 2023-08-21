// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'explore_people_bloc.dart';

@immutable
abstract class ExplorePeopleState {}

class ExplorePeopleInitial extends ExplorePeopleState {}

class ExplorePeopleloading extends ExplorePeopleState {}

class ExplorePeopleloaded extends ExplorePeopleState {

  final List<User> result;
  ExplorePeopleloaded({
    required this.result,
  });

}
