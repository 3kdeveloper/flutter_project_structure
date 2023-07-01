import 'package:flutter/material.dart';

import '../../main.dart';
import '../constants/flavor_resource.dart';
import '../enums/flavor.dart';
import '../route/route.dart';
import 'flavor_config.dart';

void stagingMain() async {
  FlavorConfig(
      flavor: Flavor.staging,
      values: FlavorValues(
          apiBaseUrl: FlavorResouces.stagingBaseUrl,
          apiKey: FlavorResouces.stagingApiKey,
          googleClientId: FlavorResouces.stagingGoogleClientId));
  mainCommon();
  return runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
