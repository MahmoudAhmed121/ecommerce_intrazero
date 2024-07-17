import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/core/utils/shared.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListner extends StatelessWidget {
  const LoginBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current.status == LoginStateStatus.suscess ||
          current.status == LoginStateStatus.error ||
          current.status == LoginStateStatus.loading,
      listener: (context, state) {
        switch (state.status) {
          case LoginStateStatus.suscess:
            context.pop();
            break;
          case LoginStateStatus.error:
            context.pop();
            showErrorToast(
              context,
              state.errorMessage!,
            );
            break;
          case LoginStateStatus.loading:
            showLoadingDialog(context);
            break;
          default:
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
