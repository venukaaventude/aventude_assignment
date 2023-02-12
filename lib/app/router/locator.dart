import 'package:aventude_assignment/app/core/services/api.dart';
import 'package:aventude_assignment/app/core/services/authentication_service.dart';
import 'package:aventude_assignment/app/core/services/dialog_service.dart';
import 'package:aventude_assignment/app/core/services/theme_service.dart';
import 'package:aventude_assignment/app/core/viewmodels/comment_view_model.dart';
import 'package:aventude_assignment/app/core/viewmodels/home_view_model.dart';
import 'package:aventude_assignment/app/core/viewmodels/login_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => ThemeService());
  locator.registerLazySingleton(() => DialogService());

  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => CommentViewModel());
}
