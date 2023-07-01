import 'package:flutter/material.dart';

import '../../main.dart';
import '../constants/flavor_resource.dart';
import '../enums/flavor.dart';
import '../route/route.dart';
import 'flavor_config.dart';

void productionMain() async {
  FlavorConfig(
      flavor: Flavor.production,
      values: FlavorValues(
          apiBaseUrl: FlavorResouces.productionBaseUrl,
          apiKey: FlavorResouces.productionApiKey,
          googleClientId: FlavorResouces.productionGoogleClientId));
  mainCommon();
  return runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
