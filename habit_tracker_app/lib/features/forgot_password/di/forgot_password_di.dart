import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'forgot_password_di.config.dart'; 

@InjectableInit(
  initializerName: 'initForgotPassword',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/forgot_password'],
)
void configureForgotPassword(GetIt getIt) {
  getIt.initForgotPassword();
}
