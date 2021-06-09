import 'package:interview_gigaservice_flutter/core/services/api.dart';
import 'package:interview_gigaservice_flutter/pages/home/home_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerFactory(() => HomeViewModel());
  locator.registerLazySingleton(() => Api());
  // locator.registerLazySingleton(() => StorageService());
}
