import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/google_fit_connect/google_fit_connect_cubit.dart';
import 'package:heka_health/heka_connect/heka_platform_state.dart';
import 'package:heka_health/repository/heka_repository.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
      create: (context) => GoogleFitConnectCubit(
        hekaHealth,
        userUuid,
        PlatformName.appleHealth,
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
    context.read<GoogleFitConnectCubit>().checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleFitConnectCubit, HekaPlatformState>(
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
                    disconnecting: (userUuid, paymentPlan) => Text(
                      'Disconnecting...',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
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
                    connected: (_, __, plan) => Text(
                      '',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    tokenInvalidated: (_, __, ___) => Text(
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
                        disconnecting: (userUuid, paymentPlan) => null,
                        tokenInvalidated: (_, __, ___) => null,
                        error: (error, userUuid, plan) => null,
                        initial: (_, plan) => null,
                        checkingConnection: (_, plan) => null,
                        noConnection: (_, plan) => () => context
                            .read<GoogleFitConnectCubit>()
                            .createConnection(
                                platformName: PlatformName.appleHealth),
                        makingConnection: (_, plan) => null,
                        connected: (connection, uuid, plan) => () => context
                            .read<GoogleFitConnectCubit>()
                            .disconnect(uuid, connection),
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
                        tokenInvalidated: (_, __, ___) => const SizedBox(),
                        initial: (_, plan) => const Text(''),
                        checkingConnection: (_, plan) => const Text('...'),
                        disconnecting: (_, plan) => const Text('...'),
                        noConnection: (_, plan) => const Text('Connect'),
                        makingConnection: (_, plan) => const Text('...'),
                        connected: (_, __, plan) => const Text('Disconnect'),
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
