import 'package:get_it/get_it.dart';
import 'package:habit_tracker_app/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:habit_tracker_app/features/login/di/login_di.dart';
import 'package:habit_tracker_app/features/sign_up/di/sign_up_di.dart';
import 'package:habit_tracker_app/features/home/di/home_di.dart';
import 'package:habit_tracker_app/features/category/di/category_di.dart';
import 'package:habit_tracker_app/features/profile/di/profile_di.dart';
import 'package:habit_tracker_app/features/forgot_password/di/forgot_password_di.dart';
import 'package:habit_tracker_app/features/bottom_bar/di/bottom_bar_di.dart';
import 'package:habit_tracker_app/features/change_password/di/change_password_di.dart';
import 'package:habit_tracker_app/features/edit_profile/di/edit_profile_di.dart';

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib/core'],
)

Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
    configureLogin(getIt);
    configureSignUp(getIt);
    configureHome(getIt);
    configureCategory(getIt);
    configureProfile(getIt);
    configureForgotPassword(getIt);
    configureBottomBar(getIt);
    configureChangePassword(getIt);
    configureEditProfile(getIt);
}
