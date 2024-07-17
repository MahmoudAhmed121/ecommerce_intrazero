import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormFaildSection extends StatefulWidget {
  const LoginFormFaildSection({super.key});

  @override
  State<LoginFormFaildSection> createState() => _LoginFormFaildSectionState();
}

class _LoginFormFaildSectionState extends State<LoginFormFaildSection> {
  late final TextEditingController emailCon;
  late final TextEditingController passCon;
  late final FocusNode emailFocusNode;
  late final FocusNode passFocusNode;
  late final GlobalKey<FormState> formKey;
  bool obscureText = true;

  @override
  void initState() {
    super.initState();

    emailCon = CubitsLocator.loginCubit.emailCon;
    passCon = CubitsLocator.loginCubit.passCon;
    emailFocusNode = CubitsLocator.loginCubit.emailFocusNode;
    passFocusNode = CubitsLocator.loginCubit.passFocusNode;
    formKey = CubitsLocator.loginCubit.formKey;

    CubitsLocator.loginCubit.reInit();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          DefaultTextFormField(
            controller: emailCon,
            focusNode: emailFocusNode,
            label: '',
            textInputType: TextInputType.emailAddress,
            hint: 'Your Email',
            validator: MyValidators.emailValidator,
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(passFocusNode);
            },
          ),
          SizedBox(
            height: 15.h,
          ),
          DefaultTextFormField(
            controller: passCon,
            focusNode: passFocusNode,
            label: '',
            textInputType: TextInputType.visiblePassword,
            hint: 'Password',
            obscureText: obscureText,
            validator: MyValidators.passwordValidator,
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: const Icon(
                Icons.visibility,
                color: AppColor.kEnableDotColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
