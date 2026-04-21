import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'edit_profile_di.config.dart'; 

@InjectableInit(
  initializerName: 'initEditProfile',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/edit_profile'],
)
void configureEditProfile(GetIt getIt) {
  getIt.initEditProfile();
}
