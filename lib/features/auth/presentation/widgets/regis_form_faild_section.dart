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

    nameCon = CubitsLocator.regisCubit.nameCon;
    emailCon = CubitsLocator.regisCubit.emailCon;
    phoneCon = CubitsLocator.regisCubit.phoneCon;
    addressCon = CubitsLocator.regisCubit.addressCon;
    passOneCon = CubitsLocator.regisCubit.passOneCon;
    passTwoCon = CubitsLocator.regisCubit.passTwoCon;

    nameFocusNode = CubitsLocator.regisCubit.nameFocusNode;
    phoneFocusNode = CubitsLocator.regisCubit.phoneFocusNode;
    addressFocusNode = CubitsLocator.regisCubit.addressFocusNode;
    emailFocusNode = CubitsLocator.regisCubit.emailFocusNode;
    passOneFocusNode = CubitsLocator.regisCubit.passOneFocusNode;
    passTwoFocusNode = CubitsLocator.regisCubit.passTwoFocusNode;
    formKey = CubitsLocator.regisCubit.formKey;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          controller: passOneCon,
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
          validator: MyValidators.emailValidator,
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
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureTextOne = !obscureTextOne;
              });
            },
            icon: const Icon(Icons.visibility),
            color: AppColor.kEnableDotColor,
          ),
          validator: MyValidators.emailValidator,
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
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureTextTwo = !obscureTextTwo;
              });
            },
            icon: const Icon(Icons.visibility),
            color: AppColor.kEnableDotColor,
          ),
          validator: MyValidators.emailValidator,
          onEditingComplete: () {
            FocusScope.of(context).unfocus();
          },
        ),
      ],
    );
  }
}
