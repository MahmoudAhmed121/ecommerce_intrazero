import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/core/helpers/extensions.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisScreen extends StatefulWidget {
  const RegisScreen({super.key});

  @override
  State<RegisScreen> createState() => _RegisScreenState();
}

class _RegisScreenState extends State<RegisScreen> {
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
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: PopScope(
          canPop: false,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        color: AppColor.kPrimaryColor,
                        width: size.width * 0.2,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Lets get started',
                        style: AppStyle.font14_700Weight.copyWith(
                          color: AppColor.kSecondaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Create an new account',
                        style: AppStyle.font12_400Weight.copyWith(
                          color: AppColor.kEnableDotColor,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
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
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'have a account?  ',
                            style: AppStyle.font12_400Weight,
                          ),
                          InkWell(
                            onTap: () {
                              context.pushReplacementNamed(loginScreen);
                            },
                            child: Text(
                              'Sign In',
                              style: AppStyle.font12_400Weight.copyWith(
                                color: AppColor.kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomSheet: CustomBottomsheet(
        onPressed: () {
          if (formKey.currentState!.validate()) {}
        },
        text: 'Login',
      ),
    );
  }
}
