import 'package:ecommerce_intrazero/core/export.dart';
import 'package:ecommerce_intrazero/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  CubitsLocator.setup();
  await ScreenUtil.ensureScreenSize();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Bloc.observer = AppBlocObserver();
}
