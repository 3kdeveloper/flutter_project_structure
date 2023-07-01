import 'package:flutter/material.dart';

import '../../main.dart';
import '../constants/flavor_resource.dart';
import '../enums/flavor.dart';
import '../route/route.dart';
import 'flavor_config.dart';

void acceptanceMain() async {
  FlavorConfig(
      flavor: Flavor.acceptance,
      values: FlavorValues(
          apiBaseUrl: FlavorResouces.acceptanceBaseUrl,
          apiKey: FlavorResouces.acceptanceApiKey,
          googleClientId: FlavorResouces.acceptanceGoogleClientId));
  mainCommon();
  return runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
