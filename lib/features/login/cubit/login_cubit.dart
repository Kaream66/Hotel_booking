import 'package:bloc/bloc.dart';
import 'package:hotel_app/core/services/auth_with_email_and_password.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthWithEmailAndPassword _authWithEmailAndPassword;
  LoginCubit({required this._authWithEmailAndPassword}) : super(LoginInitial());
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await _authWithEmailAndPassword.signIn(email: email, password: password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
