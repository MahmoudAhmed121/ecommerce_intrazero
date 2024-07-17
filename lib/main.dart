import 'dart:async';
import 'dart:developer';

import 'package:ecommerce_intrazero/app.dart';
import 'package:ecommerce_intrazero/app_init.dart';
import 'package:ecommerce_intrazero/core/navigations/route_observer.dart';
import 'package:ecommerce_intrazero/core/navigations/routes.dart';
import 'package:flutter/material.dart';

void main() async {
  runZonedGuarded(
    () async {
      await initializeApp();

      runApp(
        MyApp(
          appRouter: AppRouter(),
          routeLogger: RouteLogger(),
        ),
      );
    },
    (error, stack) {
      log(stack.toString(), name: 'main error');
    },
  );
}
