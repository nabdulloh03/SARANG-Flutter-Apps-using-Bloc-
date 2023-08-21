import 'package:berayean/src/features/likes_you/data/data_user_dummy.dart';
import 'package:berayean/src/features/likes_you/domain/user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'explore_people_event.dart';
part 'explore_people_state.dart';

class ExplorePeopleBloc extends Bloc<ExplorePeopleEvent, ExplorePeopleState> {
  ExplorePeopleBloc() : super(ExplorePeopleInitial()) {
    on<OnExplorePeopleEventCalled>((event, emit) async {
      // TODO: implement event handler
      emit(ExplorePeopleloading());
      await Future.delayed(Duration(seconds: 1));
      emit(ExplorePeopleloaded(result: dataUserDummy));
    });
  }
}
