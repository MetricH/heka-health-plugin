import 'dart:io';
import 'package:flutter/material.dart';
import 'google_fit_connect/google_fit_connect_button.dart';
import 'heka_health_helper.dart';
import 'ios_connect/ios_health_connect_button.dart';

class HekaHealthWidget extends StatelessWidget {
  final HekaHealth hekaHealth;
  final String userUuid;

  const HekaHealthWidget({
    super.key,
    required this.hekaHealth,
    required this.userUuid,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? GoogleFitConnectWidget(hekaHealth: hekaHealth, userUuid: userUuid)
        : IosHealthConnectWidget(hekaHealth: hekaHealth, userUuid: userUuid);
  }
}
