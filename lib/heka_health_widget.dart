import 'package:flutter/material.dart';
import 'package:heka_health/heka_health.dart';
import 'package:heka_health/repository/heka_repository.dart';
import 'heka_connect/presentation/heka_connect_widget.dart';

class HekaHealthWidget extends StatelessWidget {
  final String apiKey;
  final String userUuid;
  // Ability to set custom platform labels for connect button
  final Map<HekaPlatform, String> platformConnectLabels;

  const HekaHealthWidget({
    super.key,
    required this.apiKey,
    required this.userUuid,
    this.platformConnectLabels = const {},
  });

  @override
  Widget build(BuildContext context) {
    return HekaConnectWidget(
      hekaHealth: HekaHealth(apiKey),
      userUuid: userUuid,
      platformConnectLabels: platformConnectLabels,
    );
  }
}
