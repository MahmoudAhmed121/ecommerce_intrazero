import 'package:ecommerce_intrazero/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildAppWithProviders({required Widget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => ServiceLocator.homeLayoutCubit,
      ),
      BlocProvider(
        create: (_) => ServiceLocator.allProductsCubit,
      ),
      BlocProvider(
        create: (_) => ServiceLocator.productsCubit,
      ),
    ],
    child: child,
  );
}
