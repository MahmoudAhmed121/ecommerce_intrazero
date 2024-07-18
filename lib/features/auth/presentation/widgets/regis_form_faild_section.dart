import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisFormFaildSection extends StatefulWidget {
  const RegisFormFaildSection({super.key});

  @override
  State<RegisFormFaildSection> createState() => _RegisFormFaildSectionState();
}

class _RegisFormFaildSectionState extends State<RegisFormFaildSection> {
  late final TextEditingController nameCon;
  late final TextEditingController emailCon;
  late final TextEditingController phoneCon;
  late final TextEditingController addressCon;
  late final TextEditingController passOneCon;
  late final TextEditingController passTwoCon;

  late final FocusNode nameFocusNode;
  late final FocusNode phoneFocusNode;
  late final FocusNode addressFocusNode;
  late final FocusNode emailFocusNode;
  late final FocusNode passOneFocusNode;
  late final FocusNode passTwoFocusNode;
  late final GlobalKey<FormState> formKey;

  bool obscureTextOne = true;
  bool obscureTextTwo = true;

  @override
  void initState() {
    super.initState();

    nameCon = ServiceLocator.regisCubit.nameCon;
    emailCon = ServiceLocator.regisCubit.emailCon;
    phoneCon = ServiceLocator.regisCubit.phoneCon;
    addressCon = ServiceLocator.regisCubit.addressCon;
    passOneCon = ServiceLocator.regisCubit.passOneCon;
    passTwoCon = ServiceLocator.regisCubit.passTwoCon;

    nameFocusNode = ServiceLocator.regisCubit.nameFocusNode;
    phoneFocusNode = ServiceLocator.regisCubit.phoneFocusNode;
    addressFocusNode = ServiceLocator.regisCubit.addressFocusNode;
    emailFocusNode = ServiceLocator.regisCubit.emailFocusNode;
    passOneFocusNode = ServiceLocator.regisCubit.passOneFocusNode;
    passTwoFocusNode = ServiceLocator.regisCubit.passTwoFocusNode;
    formKey = ServiceLocator.regisCubit.formKey;

    ServiceLocator.regisCubit.reInit();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          DefaultTextFormField(
            controller: nameCon,
            focusNode: nameFocusNode,
            label: '',
            textInputType: TextInputType.name,
            hint: 'Full Name',
            validator: MyValidators.validateName,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(emailFocusNode);
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          DefaultTextFormField(
            controller: emailCon,
            focusNode: emailFocusNode,
            label: '',
            textInputType: TextInputType.emailAddress,
            hint: 'Your Email',
            validator: MyValidators.emailValidator,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(phoneFocusNode);
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          DefaultTextFormField(
            controller: phoneCon,
            focusNode: phoneFocusNode,
            label: '',
            textInputType: TextInputType.number,
            hint: 'Your Phone',
            validator: MyValidators.isValidateMobile,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(addressFocusNode);
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          DefaultTextFormField(
            controller: addressCon,
            focusNode: addressFocusNode,
            label: '',
            textInputType: TextInputType.streetAddress,
            hint: 'Your Address',
            validator: MyValidators.validateAddress,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(passOneFocusNode);
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          DefaultTextFormField(
            controller: passOneCon,
            focusNode: passOneFocusNode,
            label: '',
            textInputType: TextInputType.visiblePassword,
            hint: 'Password',
            obscureText: obscureTextOne,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  obscureTextOne = !obscureTextOne;
                });
              },
              child: const Icon(
                Icons.visibility,
                color: AppColor.kEnableDotColor,
              ),
            ),
            validator: MyValidators.passwordValidator,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(passTwoFocusNode);
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          DefaultTextFormField(
            controller: passTwoCon,
            focusNode: passTwoFocusNode,
            label: '',
            textInputType: TextInputType.visiblePassword,
            obscureText: obscureTextTwo,
            hint: 'Password Again',
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  obscureTextTwo = !obscureTextTwo;
                });
              },
              child: const Icon(
                Icons.visibility,
                color: AppColor.kEnableDotColor,
              ),
            ),
            validator: (value) {
              return MyValidators.repeatPasswordValidator(
                value: value,
                password: passOneCon.text,
              );
            },
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
          ),
        ],
      ),
    );
  }
}
