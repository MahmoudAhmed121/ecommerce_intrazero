import 'package:bloc/bloc.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial);

  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final FocusNode passFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  reInit() {
    emit(LoginState.initial);
    emailCon.clear();
    passCon.clear();

    formKey.currentState?.reset();
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      if (isClosed) return;
      emit(state.loading());
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailCon.text,
          password: passCon.text,
        );
        emit(state.suscess());
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: 'The Email Or Password Is Incorrect',
        ));
      }
    }
  }

  @override
  Future<void> close() {
    emailCon.dispose();
    passCon.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();

    return super.close();
  }
}
