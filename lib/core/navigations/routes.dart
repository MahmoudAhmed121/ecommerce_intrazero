import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_intrazero/features/auth/presentation/screens/regis_screen.dart';
import 'package:ecommerce_intrazero/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const SplashScreen();
          },
        );

      case loginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        );

      case registerScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const RegisScreen();
          },
        );
    }

    return null;
  }
}
