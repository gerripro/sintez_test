import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'ioc.config.dart';

final ioc = GetIt.instance;

@injectableInit
void configureDependencies() => ioc.init();
