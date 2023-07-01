import 'package:flutter/material.dart';

import '../../main.dart';
import '../constants/flavor_resource.dart';
import '../enums/flavor.dart';
import '../route/route.dart';
import 'flavor_config.dart';

void developmentMain() async {
  FlavorConfig(
      flavor: Flavor.development,
      values: FlavorValues(
          apiBaseUrl: FlavorResouces.developmentBaseUrl,
          apiKey: FlavorResouces.developmentApiKey,
          googleClientId: FlavorResouces.developmentGoogleClientId));
  mainCommon();
  return runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
