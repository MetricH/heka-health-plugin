import 'package:heka_health/heka_health_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
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
          child: Card(
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
                tokenInvalidated: (_, __) => Text(
                  'Disconnected from our systems',
                  style: Theme.of(context).textTheme.caption,
                ),
                makingConnection: (_) => Text(
                  'Making connection...',
                  style: Theme.of(context).textTheme.caption,
                ),
                connected: (_, __) => Text(
                  _.lastSync == null
                      ? 'Last synced 1 min ago'
                      : 'Last synced ${timeago.format(DateTime.parse(_.lastSync!))}',
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
                    noConnection: (_) =>
                        context.read<GoogleFitConnectCubit>().createConnection,
                    tokenInvalidated: (connection, __) => () => context
                        .read<GoogleFitConnectCubit>()
                        .connectAgain(connection.id),
                    makingConnection: (_) => null,
                    connected: (connection, __) => () => context
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
                    error: (error, userUuid) => const SizedBox(),
                    initial: (_) => const Text(''),
                    checkingConnection: (_) => const Text('...'),
                    noConnection: (_) => const Text('Connect'),
                    tokenInvalidated: (_, __) => const Text('Connect Again'),
                    makingConnection: (_) => const Text('...'),
                    connected: (_, __) => const Text('Disconnect'),
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
