import 'package:flutter/material.dart';
import 'package:heka_health/heka_health.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _apiKey = '6370f2c7-ddda-49bf-868d-aa9d704b1644';
  final _userUuid = 'moksh@pravegak.in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HekaHealth Demo'),
      ),
      body: Center(
        child: HekaHealthWidget(
          apiKey: _apiKey,
          userUuid: _userUuid,
        ),
      ),
    );
  }
}
