import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
    context.read<IosConnectCubit>().checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IosConnectCubit, IosConnectState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  leading: const Icon(
                    MdiIcons.apple,
                  ),
                  title: const Text(
                    'Apple HealthKit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: state.when(
                    error: (error, userUuid, plan) {
                      return Text(
                        error.message,
                        style: const TextStyle(color: Colors.red),
                      );
                    },
                    initial: (_, plan) => Text(
                      '',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    checkingConnection: (_, plan) => Text(
                      'Checking connection...',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    noConnection: (_, plan) => Text(
                      '',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    makingConnection: (_, plan) => Text(
                      'Making connection...',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    syncingData: (_, __, plan) => Text(
                      '',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  trailing: state.maybeWhen(
                    error: (error, userUuid, plan) => const SizedBox(),
                    checkingConnection: (userUuid, plan) =>
                        const SizedBox.square(
                      dimension: 16,
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                    makingConnection: (userUuid, plan) => const SizedBox.square(
                      dimension: 16,
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                    orElse: () => ElevatedButton(
                      onPressed: state.when(
                        error: (error, userUuid, plan) => null,
                        initial: (_, plan) => null,
                        checkingConnection: (_, plan) => null,
                        noConnection: (_, plan) =>
                            context.read<IosConnectCubit>().createConnection,
                        makingConnection: (_, plan) => null,
                        syncingData: (_, __, plan) =>
                            context.read<IosConnectCubit>().disconnect,
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
                        error: (error, userUuid, plan) => const SizedBox(),
                        initial: (_, plan) => const Text(''),
                        checkingConnection: (_, plan) => const Text('...'),
                        noConnection: (_, plan) => const Text('Connect'),
                        makingConnection: (_, plan) => const Text('...'),
                        syncingData: (_, __, plan) => const Text('Disconnect'),
                      ),
                    ),
                  ),
                ),
                if (state.paymentPlan == 'free') ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Powered by ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      InkWell(
                        onTap: () {
                          launch('https://www.hekahealth.co/');
                        },
                        child: const Text(
                          'Heka',
                          style: TextStyle(
                            color: Color(
                              0xff2351C1,
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  const SizedBox(height: 4),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
