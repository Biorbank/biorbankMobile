import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool isShowPassword = true;
  bool isUnlockFaceId = true;
  TextEditingController pinCodeTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  void togglePasswordVisibility() {
    emit(AuthInitial());
    isShowPassword = !isShowPassword;
    emit(PasswordVisibilityState());
  }

  void toggleFaceIdSwitch({required bool value}) {
    emit(AuthInitial());
    isUnlockFaceId = value;
    emit(PasswordVisibilityState());
  }
}
