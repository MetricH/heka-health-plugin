import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../heka_health_helper.dart';
import 'ios_connect_cubit.dart';

class IosHealthConnectWidget extends StatelessWidget {
  final HekaHealth hekaHealth;
  final String userUuid;
  const IosHealthConnectWidget({
    super.key,
    required this.hekaHealth,
    required this.userUuid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IosConnectCubit(
        userUuid,
        hekaHealth,
      ),
      child: const IosHealthConnectButton(),
    );
  }
}

class IosHealthConnectButton extends StatefulWidget {
  const IosHealthConnectButton({super.key});

  @override
  State<IosHealthConnectButton> createState() => _IosHealthConnectButtonState();
}

class _IosHealthConnectButtonState extends State<IosHealthConnectButton> {
  @override
  void initState() {
    super.initState();
    // context.read<IosConnectCubit>().requestHealthKitPermissions();
    // context
    //     .read<IosConnectCubit>()
    //     .checkHealthKitPermissions()
    //     .then((value) => print("Hello: $value"));
    context.read<IosConnectCubit>().checkConnection(_syncData);
  }

  Future<void> _syncData(
    String apiKey,
    String userUuid,
  ) =>
      context.read<IosConnectCubit>().syncData(userUuid);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IosConnectCubit, IosConnectState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(
                MdiIcons.apple,
                color: Colors.red,
              ),
              title: const Text(
                'Apple HealthKit',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: state.when(
                error: (error, userUuid) {
                  return Text(
                    error.message,
                    style: const TextStyle(color: Colors.red),
                  );
                },
                initial: (_) => Text(
                  '',
                  style: Theme.of(context).textTheme.caption,
                ),
                checkingConnection: (_) => Text(
                  'Checking connection...',
                  style: Theme.of(context).textTheme.caption,
                ),
                noConnection: (_) => Text(
                  '',
                  style: Theme.of(context).textTheme.caption,
                ),
                makingConnection: (_) => Text(
                  'Making connection...',
                  style: Theme.of(context).textTheme.caption,
                ),
                syncingData: (_, __) => Text(
                  '',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              trailing: state.maybeWhen(
                error: (error, userUuid) => const SizedBox(),
                checkingConnection: (userUuid) => const SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
                makingConnection: (userUuid) => const SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
                orElse: () => ElevatedButton(
                  onPressed: state.when(
                    error: (error, userUuid) => null,
                    initial: (_) => null,
                    checkingConnection: (_) => null,
                    noConnection: (_) => () => context
                        .read<IosConnectCubit>()
                        .createConnection(_syncData),
                    makingConnection: (_) => null,
                    syncingData: (_, __) => null,
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: state.when(
                    error: (error, userUuid) => const SizedBox(),
                    initial: (_) => const Text(''),
                    checkingConnection: (_) => const Text('...'),
                    noConnection: (_) => const Text('Connect'),
                    makingConnection: (_) => const Text('...'),
                    syncingData: (_, __) => const Text('Connected'),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
