import 'package:heka_health/heka_health_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'google_fit_connect_cubit.dart';

class GoogleFitConnectWidget extends StatelessWidget {
  final HekaHealth hekaHealth;
  final String userUuid;
  const GoogleFitConnectWidget({
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
      ),
      child: const GoogleFitConectButton(),
    );
  }
}

class GoogleFitConectButton extends StatefulWidget {
  const GoogleFitConectButton({super.key});

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
    return BlocBuilder<GoogleFitConnectCubit, GoogleFitConnectState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Card(
                elevation: 2,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  leading: const Icon(
                    MdiIcons.googleFit,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Google Fit',
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
                      style: Theme.of(context).textTheme.caption,
                    ),
                    checkingConnection: (_, plan) => Text(
                      'Checking connection...',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    noConnection: (_, plan) => Text(
                      '',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    tokenInvalidated: (_, __, plan) => Text(
                      'Disconnected from our systems',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    makingConnection: (_, plan) => Text(
                      'Making connection...',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    connected: (_, __, plan) => Text(
                      _.lastSync == null
                          ? 'Last synced 1 min ago'
                          : 'Last synced ${timeago.format(DateTime.parse(_.lastSync!))}',
                      style: Theme.of(context).textTheme.caption,
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
                        noConnection: (_, plan) => context
                            .read<GoogleFitConnectCubit>()
                            .createConnection,
                        tokenInvalidated: (connection, __, plan) => () =>
                            context
                                .read<GoogleFitConnectCubit>()
                                .connectAgain(connection.id),
                        makingConnection: (_, plan) => null,
                        connected: (connection, __, plan) => () => context
                            .read<GoogleFitConnectCubit>()
                            .disconnect(connection.id),
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
                        tokenInvalidated: (_, __, plan) =>
                            const Text('Connect Again'),
                        makingConnection: (_, plan) => const Text('...'),
                        connected: (_, __, plan) => const Text('Disconnect'),
                      ),
                    ),
                  ),
                ),
              ),
              if (state.paymentPlan == 'free')
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
                )
            ],
          ),
        );
      },
    );
  }
}
