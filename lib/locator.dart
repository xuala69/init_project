import 'package:get_it/get_it.dart';
import 'package:init_project/services/navigation.dart';
import 'package:init_project/services/secure_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => SecureService());
  locator.registerLazySingleton(() => NavigationService());
}
