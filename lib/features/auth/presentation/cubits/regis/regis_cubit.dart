import 'package:bloc/bloc.dart';
import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/core/services/locator/firestore_locator.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisCubit extends Cubit<RegisState> {
  RegisCubit() : super(RegisState.initial);

  final UserCollection _userCollection = FirestoreLocator.userCollection;

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

  void reInit() {
    nameCon.clear();
    emailCon.clear();
    phoneCon.clear();
    addressCon.clear();
    passOneCon.clear();
    passTwoCon.clear();
    formKey.currentState?.reset();

    emit(state.copyWith(status: RegisStateStatus.initial));
  }

  Future<void> createAccount() async {
    if (formKey.currentState!.validate()) {
      emit(state.loading());

      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailCon.text,
          password: passOneCon.text,
        )
            .then((value) async {
          final userModel = UserModel(
            id: value.user!.uid,
            email: emailCon.text,
            name: nameCon.text,
            phone: phoneCon.text,
            address: addressCon.text,
            createdAt: DateTime.now().toString(),
            imageUrl: '',
          );

          await _userCollection.addUser(
            userModel,
            userId: value.user!.uid,
          );
        });

        emit(state.suscess());
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(
          status: RegisStateStatus.error,
          errorMessage: e.message,
        ));
      }
    }
  }

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
