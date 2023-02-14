import 'package:flutter/material.dart';
import 'package:heka_health/repository/heka_repository.dart';
import 'heka_connect/presentation/heka_connect_widget.dart';

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
    return HekaConnectWidget(
      hekaHealth: HekaHealth(apiKey),
      userUuid: userUuid,
    );
  }
}
