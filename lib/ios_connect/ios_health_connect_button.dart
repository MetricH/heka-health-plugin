import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../heka_health_helper.dart';
import '../loader.dart';
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
        if (state.userUuid.isEmpty) {
          return const SizedBox();
        }
        return state.when(
          initial: (cachedUserUuid) => ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24)),
            icon: const Icon(Icons.fitbit),
            onPressed: () =>
                context.read<IosConnectCubit>().checkConnection(_syncData),
            label: const Text('Sync Health Data'),
          ),
          permissionsDenied: (_) => Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Heath Permissions are denied. Kindly grant permission on the Health App and restart.',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.red),
              ),
            ),
          ),
          checkingConnection: (_) =>
              const Loader(text: 'Checking connection...'),
          makingConnection: (_) => const Loader(text: 'Making connection...'),
          syncingData: (_, __) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Syncing Data...',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.green),
              ),
              const SizedBox(height: 24),
              Text(
                'id: ${_.id}\nuser uuid: ${_.userUuid}\nplatform: ${_.platform}\napp: ${_.app}',
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
