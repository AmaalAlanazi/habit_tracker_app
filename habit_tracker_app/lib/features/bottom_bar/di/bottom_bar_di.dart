import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'bottom_bar_di.config.dart'; 

@InjectableInit(
  initializerName: 'initBottomBar',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/bottom_bar'],
)
void configureBottomBar(GetIt getIt) {
  getIt.initBottomBar();
}
