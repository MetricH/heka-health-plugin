import 'package:flutter/material.dart';
import 'package:heka_health/heka_health.dart';

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
  static const _apiKey = '';
  final _userUuid = '';

  @override
  void initState() {
    super.initState();
    // Demonstrating how to check if a user is connected to a platform
    // For Apple Healthkit, platformName is "apple_healthkit"
    HekaManager.isUserConnected(
            key: _apiKey, uuid: _userUuid, platformName: "google_fit")
        .then((value) {
      if (value) {
        print("User is connected");
      } else {
        print("User is not connected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HekaHealth Demo'),
      ),
      body: HekaHealthWidget(
        apiKey: _apiKey,
        userUuid: _userUuid,
      ),
    );
  }
}
