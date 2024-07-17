import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/core/helpers/extensions.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailCon;
  late final TextEditingController passCon;
  late final FocusNode passFocusNode;
  late final FocusNode emailFocusNode;
  late final GlobalKey<FormState> formKey;

  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    emailCon = TextEditingController();
    passCon = TextEditingController();
    passFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    emailCon.dispose();
    passCon.dispose();
    passFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Form(
          key: formKey,
          child: SizedBox(
            width: size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    color: AppColor.kPrimaryColor,
                    width: size.width * 0.2,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Welcome to Intrazero',
                    style: AppStyle.font14_700Weight.copyWith(
                      color: AppColor.kSecondaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Sign in to continue',
                    style: AppStyle.font12_400Weight.copyWith(
                      color: AppColor.kEnableDotColor,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
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
                    height: 50,
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
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: const Icon(Icons.visibility),
                      color: AppColor.kEnableDotColor,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?  ',
                        style: AppStyle.font12_400Weight,
                      ),
                      InkWell(
                        onTap: () {
                          context.pushReplacementNamed(registerScreen);
                        },
                        child: Text(
                          'Register',
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
      bottomSheet: CustomBottomsheet(
        onPressed: () {},
        text: 'Sign Up',
      ),
    );
  }
}
