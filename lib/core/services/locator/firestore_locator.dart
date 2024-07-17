import 'package:ecommerce_intrazero/core/export.dart';
import 'package:get_it/get_it.dart';

class FirestoreLocator {
  static final GetIt locator = GetIt.instance;

  static void setup() {
    locator.registerLazySingleton(() => UserCollection());
  }

  static UserCollection get userCollection => locator.get<UserCollection>();
}
