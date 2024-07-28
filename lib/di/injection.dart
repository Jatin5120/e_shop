import 'package:e_shop/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final kGetIt = GetIt.instance;

@InjectableInit()
void configureInjection() => kGetIt.init();
