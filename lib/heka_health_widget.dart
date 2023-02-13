import 'dart:io';
import 'package:flutter/material.dart';
import 'package:heka_health/repository/heka_repository.dart';
import 'google_fit_connect/google_fit_connect_button.dart';
import 'ios_connect/ios_health_connect_button.dart';

class HekaHealthWidget extends StatelessWidget {
  final String apiKey;
  final String userUuid;

  const HekaHealthWidget({
    super.key,
    required this.apiKey,
    required this.userUuid,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? GoogleFitConnectWidget(
            hekaHealth: HekaHealth(apiKey), userUuid: userUuid)
        : IosHealthConnectWidget(
            hekaHealth: HekaHealth(apiKey), userUuid: userUuid);
  }
}
