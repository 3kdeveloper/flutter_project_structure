import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/blocs/home/bloc/home_bloc.dart';
import 'package:flutter_project_structure/helper/constants/route_names.dart';
import 'package:flutter_project_structure/helper/flavors/flavor_config.dart';
import 'package:flutter_project_structure/presentation/screens/init/init_screen.dart';
import 'package:flutter_project_structure/remote/network/local_api_client.dart';
import 'package:flutter_project_structure/remote/network/network_api_client.dart';
import 'package:flutter_project_structure/remote/network/request_interceptor.dart';
import 'package:flutter_project_structure/repository/data_manager.dart';

class AppRouter {
  late HomeBloc homeBloc;
  late DataManager dataManager;

  AppRouter() {
    Dio dio = Dio((BaseOptions(
        contentType: "application/json",
        headers: {
          "Accept": "application/json",
          "api-key": FlavorConfig.instance?.values.apiKey
        },
        baseUrl: FlavorConfig.instance?.values.apiBaseUrl ?? "")));
    dio.interceptors.add(RequestInterceptor());
    dataManager = DataManager(
        localApiClient: LocalApiClient(),
        networkApiClient: NetworkApiClient(dio));
    homeBloc = HomeBloc(dataManager: dataManager);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.initialScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeBloc(dataManager: dataManager),
                  child: const InitScreen(),
                ));
      default:
        return null;
    }
  }

  void dispose() {
    homeBloc.close();
  }
}
