import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_project_structure/helper/enums/network_status.dart';

class NetworkStatusService {
  StreamController<NetworkStatus> networkStatusController =
      StreamController<NetworkStatus>();
  NetworkStatus networkStatus = NetworkStatus.ONLINE;

  NetworkStatusService() {
    Connectivity().onConnectivityChanged.listen((status) {
      networkStatusController.add(_getNetworkStatus(status));
    });
  }

  Future<void> initializeNetworkService() async {
    dynamic status = await Connectivity().checkConnectivity();
    _getNetworkStatus(status);
  }

  NetworkStatus _getNetworkStatus(ConnectivityResult status) {
    NetworkStatus netState =
        status == ConnectivityResult.mobile || status == ConnectivityResult.wifi
            ? NetworkStatus.ONLINE
            : NetworkStatus.OFFLINE;
    networkStatus = netState;
    return netState;
  }
}
