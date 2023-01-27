import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:heka_health/heka_health.dart';
import 'package:heka_health_example/strava.dart';

import 'authorization_page.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

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
                  try {
                    final result = await FlutterAppAuth().authorize(
                      AuthorizationRequest(
                        '101208',
                        'com.heka.health://callback',
                        additionalParameters: <String, String>{
                          'approval_prompt': 'force',
                        },
                        
                        serviceConfiguration:
                            const AuthorizationServiceConfiguration(
                          authorizationEndpoint:
                              'https://www.strava.com/oauth/authorize',
                          tokenEndpoint: 'https://www.strava.com/oauth/token',
                        ),
                        scopes: <String>['read'],
                      ),
                    );
                    
                  } on Exception catch (e, s) {
                    debugPrint('login error: $e - stack: $s');
                  }
                },
                child: const Text('Sign In'))
          ],
        ),
      ),
    );
  }
}
