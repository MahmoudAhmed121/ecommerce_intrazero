import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/core/utils/shared.dart';
import 'package:ecommerce_intrazero/features/auth/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisBlocListner extends StatelessWidget {
  const RegisBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisCubit, RegisState>(
      listenWhen: (previous, current) =>
          current.status == RegisStateStatus.suscess ||
          current.status == RegisStateStatus.error ||
          current.status == RegisStateStatus.loading,
      listener: (context, state) {
        switch (state.status) {
          case RegisStateStatus.suscess:
            context.pop();
            context.pushReplacementNamed(homeLayoutScreen);
            break;
          case RegisStateStatus.error:
            context.pop();
            showErrorToast(
              context,
              state.errorMessage!,
            );
            break;
          case RegisStateStatus.loading:
            showLoadingDialog(context);
            break;
          default:
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
