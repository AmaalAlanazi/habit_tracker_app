import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'category_di.config.dart'; 

@InjectableInit(
  initializerName: 'initCategory',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/category'],
)
void configureCategory(GetIt getIt) {
  getIt.initCategory();
}
