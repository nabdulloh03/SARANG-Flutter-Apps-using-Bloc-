import 'package:berayean/src/features/likes_you/data/match_data.dart';
import 'package:berayean/src/features/likes_you/domain/user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'people_loved_event.dart';
part 'people_loved_state.dart';

class PeopleLovedBloc extends Bloc<PeopleLovedEvent, PeopleLovedState> {
  PeopleLovedBloc() : super(PeopleLovedInitial()) {
    on<PeopleLovedList>((event, emit) {
      emit(PeopleLovedLoading());
      emit(PeopleLovedSucess(userMatch: dataMatch));
    });

    on<AddPeopleToLovedList>((event, emit) {
      emit(PeopleLovedLoading());
      dataMatch.add(event.user);
      emit(PeopleLovedSucess(userMatch: dataMatch));
    },);
  }
}
