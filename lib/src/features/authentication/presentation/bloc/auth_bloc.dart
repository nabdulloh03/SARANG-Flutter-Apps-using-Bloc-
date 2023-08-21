import 'package:berayean/src/features/authentication/data/data_user_account_local.dart';
import 'package:berayean/src/features/authentication/domain/user_account.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterAuthEvent>((event, emit) async {
      emit(AuthLoading());
      DataUserAccountLocal.setDataUserToStorage(event.userAccount);
      UserAccountRegister.setUserAccountRegister(event.isRegister);
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthSuccess
        (
        userAccount: event.userAccount, 
        isRegister: event.isRegister,
        ),
      );
    });
  }
}
