import 'package:ecommerce_intrazero/core/utils/constants/constants.dart';
import 'package:ecommerce_intrazero/features/splach/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const SplashScreen();
          },
        );
    }

    return null;
  }
}
