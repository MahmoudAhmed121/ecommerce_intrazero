import 'package:ecommerce_intrazero/core/config/bloc_provider.dart';
import 'package:ecommerce_intrazero/core/navigations/route_observer.dart';
import 'package:ecommerce_intrazero/core/navigations/routes.dart';
import 'package:ecommerce_intrazero/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final RouteLogger routeLogger;

  const MyApp({
    super.key,
    required this.appRouter,
    required this.routeLogger,
  });

  @override
  Widget build(BuildContext context) {
    return buildAppWithProviders(
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorObservers: [
            routeLogger,
          ],
          title: 'Ecommerce Intrazero',
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: AppColor.kBackGroundColor,
            primaryColor: AppColor.kPrimaryColor,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
