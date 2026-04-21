import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'change_password_di.config.dart'; 

@InjectableInit(
  initializerName: 'initChangePassword',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/change_password'],
)
void configureChangePassword(GetIt getIt) {
  getIt.initChangePassword();
}
