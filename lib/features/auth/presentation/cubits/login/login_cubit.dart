import 'package:bloc/bloc.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial);

  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passCon = TextEditingController();
  final FocusNode passFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  test(){
    debugPrint('test login cubittttttttttttttttttt ${emailCon.text}');
  }

  @override
  Future<void> close() {
    emailCon.dispose();
    passCon.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
    debugPrint('close login cubittttttttttttttttttt');
    return super.close();
  }
}
