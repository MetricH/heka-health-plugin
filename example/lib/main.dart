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
  static const _apiKey = '7368bad8-aadd-4624-a58c-7e8af2b3cfb7';
  final _userUuid = '7895pulkit@tet.com';

  @override
  void initState() {
    super.initState();
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
