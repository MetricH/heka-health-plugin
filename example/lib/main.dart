import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:heka_health/heka_health.dart';
import 'package:heka_health_example/strava.dart';

import 'authorization_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'HekaHealth Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _apiKey = '<your api key here>';
  final _userUuid = '<your user uuid here>';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HekaHealth Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            HekaHealthWidget(
              apiKey: _apiKey,
              userUuid: _userUuid,
            ),
            ElevatedButton(
                onPressed: () async {
                  final result = await FlutterWebAuth.authenticate(
                      url:
                          "https://www.strava.com/oauth/authorize?client_id=101208&response_type=code&redirect_uri=com.heka.health://callback&approval_prompt=force&scope=read",
                      callbackUrlScheme: "com.heka.health");

                  final code = Uri.parse(result).queryParameters['code'];
                  print(code);
                },
                child: const Text('Sign In'))
          ],
        ),
      ),
    );
  }
}
