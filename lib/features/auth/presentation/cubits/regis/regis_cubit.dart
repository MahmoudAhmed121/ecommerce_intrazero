import 'package:bloc/bloc.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';
import 'package:flutter/material.dart';

class RegisCubit extends Cubit<RegisState> {
  RegisCubit() : super(RegisState.initial);
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController phoneCon = TextEditingController();
  final TextEditingController addressCon = TextEditingController();
  final TextEditingController passOneCon = TextEditingController();
  final TextEditingController passTwoCon = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passOneFocusNode = FocusNode();
  final FocusNode passTwoFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Future<void> close() {
    nameCon.dispose();
    emailCon.dispose();
    phoneCon.dispose();
    addressCon.dispose();
    passOneCon.dispose();
    passTwoCon.dispose();
    nameFocusNode.dispose();
    phoneFocusNode.dispose();
    addressFocusNode.dispose();
    emailFocusNode.dispose();
    passOneFocusNode.dispose();
    passTwoFocusNode.dispose();
    return super.close();
  }
}
