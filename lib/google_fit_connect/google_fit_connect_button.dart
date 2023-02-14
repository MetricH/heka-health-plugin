import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heka_health/heka_connect/heka_platform_state.dart';
import 'package:heka_health/repository/heka_repository.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'google_fit_connect_cubit.dart';

class GoogleFitConnectWidget extends StatelessWidget {
  final HekaHealth hekaHealth;
  final String userUuid;
  final String platformName;
  const GoogleFitConnectWidget({
    super.key,
    required this.hekaHealth,
    required this.userUuid,
    required this.platformName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleFitConnectCubit(
        hekaHealth,
        userUuid,
        platformName,
      ),
      child: GoogleFitConectButton(platformName: platformName),
    );
  }
}

class GoogleFitConectButton extends StatefulWidget {
  const GoogleFitConectButton({super.key, required this.platformName});
  final String platformName;

  @override
  State<GoogleFitConectButton> createState() => _GoogleFitConectButtonState();
}

class _GoogleFitConectButtonState extends State<GoogleFitConectButton> {
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
                    MdiIcons.googleFit,
                    color: Colors.red,
                  ),
                  title: Text(
                    widget.platformName,
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
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    disconnecting: (userUuid) => Text(
                      'Disconnecting...',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    checkingConnection: (_) => Text(
                      'Checking connection...',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    noConnection: (_) => Text(
                      '',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    tokenInvalidated: (_, __) => Text(
                      'Logged out',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    makingConnection: (_) => Text(
                      'Making connection...',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    connected: (_, __) => Text(
                      _.lastSync == null
                          ? ''
                          : 'Last synced ${timeago.format(DateTime.parse(_.lastSync!))}',
                      style: Theme.of(context).textTheme.bodySmall,
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
                    disconnecting: (userUuid) => const SizedBox.square(
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
                        disconnecting: (userUuid) => null,
                        error: (error, userUuid) => null,
                        initial: (_) => null,
                        checkingConnection: (_) => null,
                        noConnection: (_) => () => context
                            .read<GoogleFitConnectCubit>()
                            .createConnection(
                                platformName: widget.platformName),
                        tokenInvalidated: (connection, __) => () => context
                            .read<GoogleFitConnectCubit>()
                            .createConnection(
                                reconnect: true,
                                platformName: widget.platformName),
                        makingConnection: (_) => null,
                        connected: (connection, uuid) => () => context
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
                        error: (error, userUuid) => const SizedBox(),
                        initial: (_) => const Text(''),
                        checkingConnection: (_) => const Text('...'),
                        disconnecting: (_) => const Text('...'),
                        noConnection: (_) => const Text('Connect'),
                        tokenInvalidated: (_, __) =>
                            const Text('Connect Again'),
                        makingConnection: (_) => const Text('...'),
                        connected: (_, __) => const Text('Disconnect'),
                      ),
                    ),
                  ),
                ),
                // TODO: this needs to be updated when we use the new state
                if (false) ...[
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
