import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_project_structure/blocs/home/bloc_observer.dart';
import 'package:flutter_project_structure/helper/constants/constants_resources.dart';
import 'package:flutter_project_structure/helper/constants/flavor_resource.dart';
import 'package:flutter_project_structure/helper/constants/route_names.dart';
import 'package:flutter_project_structure/helper/route/route.dart';
import 'package:flutter_project_structure/helper/theme/app_theme.dart';
import 'package:flutter_project_structure/helper/utils/precache_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'helper/constants/global_variables.dart';
import 'helper/flavors/main_acceptance.dart';
import 'helper/flavors/main_dev.dart';
import 'helper/flavors/main_production.dart';
import 'helper/flavors/main_staging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await networkStatusService.initializeNetworkService();
  await Firebase.initializeApp();
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String packageName = packageInfo.packageName;
  logger.wtf("packageName: $packageName");
  precacheSvg();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runZonedGuarded(() {
    if (packageName == FlavorResouces.stagingPackageName) {
      return stagingMain();
    } else if (packageName == FlavorResouces.acceptancePackageName) {
      return acceptanceMain();
    } else if (packageName == FlavorResouces.developmentPackageName) {
      return developmentMain();
    } else {
      return productionMain();
    }
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}

void mainCommon() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String packageName = packageInfo.packageName;
  logger.wtf("Package Name: $packageName");
  await Future.delayed(const Duration(seconds: ConstantsResouces.splashDelay));
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  // static void setLocale(BuildContext context, Locale newLocale) {
  //   var state = context.findAncestorStateOfType<_MyAppState>();
  //   state?.setLocale(newLocale);
  // }

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(ConstantsResouces.appDesginWidth,
            ConstantsResouces.appDesginHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorKey: navigator,
            initialRoute: RouteNames.initialScreenRoute,
            onGenerateRoute: widget.appRouter.generateRoute,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.themeData,
            locale: _locale,
            // supportedLocales: const [
            //   Locale(StringsResource.STR_ENGLISH_LANG_CODE, ''),
            //   Locale(StringsResource.STR_FRENCH_LANG_CODE, ''),
            // ],
            // localizationsDelegates: const [
            //   AppLocalizationsDelegate(),
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            // ],
            // localeResolutionCallback: (locale, supportedLocales) {
            //   for (var supportedLocale in supportedLocales) {
            //     if (supportedLocale.languageCode == locale?.languageCode &&
            //         supportedLocale.countryCode == locale?.countryCode) {
            //       return supportedLocale;
            //     }
            //   }
            //   return supportedLocales.first;
            // },
          );
        });
  }

  @override
  void didChangeDependencies() async {
    // getLocale().then((locale) => setState(() => _locale = locale));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget.appRouter.dispose();
    super.dispose();
  }

  // void setLocale(Locale locale) => setState(() => _locale = locale);
}
