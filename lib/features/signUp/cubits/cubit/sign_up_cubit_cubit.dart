import 'package:bloc/bloc.dart';
import 'package:hotel_app/core/services/auth_with_email_and_password.dart';
import 'package:meta/meta.dart';

part 'sign_up_cubit_state.dart';

class SignUpCubitCubit extends Cubit<SignUpCubitState> {
  final AuthWithEmailAndPassword _authWithEmailAndPassword;

  SignUpCubitCubit(this._authWithEmailAndPassword) : super(SignUpCubitInitial());

  Future<void> signUp({required String email, required String password}) async {
    emit(SignUpCubitLoading());
    try {
      await _authWithEmailAndPassword.signUp(email: email, password: password);
      emit(SignUpCubitSuccess());
    } catch (e) {
      emit(SignUpCubitFailure(message: e.toString()));
    }
  }
}
