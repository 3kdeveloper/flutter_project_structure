import 'package:flutter/material.dart';
import 'package:flutter_project_structure/helper/services/network_status_service.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();
final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
NetworkStatusService networkStatusService = NetworkStatusService();
