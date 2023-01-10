import 'package:heka_health/heka_health_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../loader.dart';
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
        if (state.userUuid.isEmpty) {
          return const SizedBox();
        }
        return state.when(
          initial: (cachedUserUuid) => const SizedBox(),
          checkingConnection: (_) =>
              const Loader(text: 'Checking connection...'),
          noConnection: (_) => ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 24)),
            icon: const Icon(Icons.fitbit),
            onPressed: context.read<GoogleFitConnectCubit>().createConnection,
            label: const Text('Connect Google Fit'),
          ),
          tokenInvalidated: (connection, userUuid) {
            return Column(
              children: [
                Text(
                  "You've logged out from our systems!",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Theme.of(context).errorColor,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 24)),
                  icon: const Icon(Icons.fitbit),
                  onPressed: () => context
                      .read<GoogleFitConnectCubit>()
                      .connectAgain(connection.id),
                  label: const Text('Connect Again'),
                ),
              ],
            );
          },
          makingConnection: (_) => const Loader(text: 'Making connection...'),
          connected: (_, __) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Connected!',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.green),
              ),
              const SizedBox(height: 24),
              Text(
                'id: ${_.id}\nuser uuid: ${_.userUuid}\nplatform: ${_.platform}\napp: ${_.app}\nlast sync: ${_.lastSync}',
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
