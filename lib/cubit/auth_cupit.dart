import 'package:bokiaaa/core/api_servise.dart';
import 'package:bokiaaa/core/login_model.dart';
import 'package:bokiaaa/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCupit extends Cubit<AuthStates> {
  AuthCupit() : super(AuthInitial());
  late LoginModel loginModel;
  loginState({required String email, required String password}) async {
    try {
      emit(LoginLoadingstate());
      loginModel = await ApiService().login(email, password);
      emit(Loginstate());
    } catch (e) {
      emit(LoginErrorstate());
    }
  }
}
