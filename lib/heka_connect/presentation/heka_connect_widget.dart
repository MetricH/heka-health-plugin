import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/heka_api/platforms.dart';
import 'package:heka_health/heka_connect/application/heka_connect_cubit.dart';
import 'package:heka_health/heka_connect/application/heka_connect_state.dart';
import 'package:heka_health/heka_connect/application/heka_platform_state.dart';
import 'package:heka_health/repository/heka_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class HekaConnectWidget extends StatelessWidget {
  final HekaHealth hekaHealth;
  final String userUuid;
  final Map<HekaPlatform, String> platformConnectLabels;
  const HekaConnectWidget({
    super.key,
    required this.hekaHealth,
    required this.userUuid,
    this.platformConnectLabels = const {},
  });

  @override
  Widget build(BuildContext context) {
    Map<String, String> platformConnectLabelsStr = platformConnectLabels.map(
      (key, value) => MapEntry(key.toInternalString(), value),
    );
    return BlocProvider(
      create: (context) => HekaConnectCubit(
        userUuid,
        hekaHealth,
      ),
      child: _HekaConnectWidget(platformConnectLabelsStr),
    );
  }
}

class _HekaConnectWidget extends StatefulWidget {
  final Map<String, String> platformConnectLabels;
  const _HekaConnectWidget(this.platformConnectLabels);

  @override
  State<_HekaConnectWidget> createState() => _HekaConnectWidgetState();
}

class _HekaConnectWidgetState extends State<_HekaConnectWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HekaConnectCubit, HekaConnectState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Card(
              elevation: 2,
              child: state.loadingFailed
                  ? const SomethingWentWrong()
                  : state.isLoading
                      // TODO: replace with shimmer effect
                      ? const CircularProgressIndicator()
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...state.platformStates.entries.map(
                              (e) => PlatformConnectCard(
                                platformName: e.key,
                                state: e.value,
                                platformConnectLabel:
                                    widget.platformConnectLabels[e.key],
                              ),
                            ),
                            if (state.paymentPlan == 'free') ...[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Powered by ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(
                                          'https://www.metric.health/'));
                                    },
                                    child: const Text(
                                      'Metric',
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
          ),
        );
      },
    );
  }
}

class PlatformConnectCard extends StatefulWidget {
  final String platformName;
  final HekaPlatformState state;
  final String? platformConnectLabel;
  const PlatformConnectCard({
    super.key,
    required this.platformName,
    required this.state,
    this.platformConnectLabel,
  });
  @override
  State<PlatformConnectCard> createState() => _PlatformConnectCardState();
}

class _PlatformConnectCardState extends State<PlatformConnectCard> {
  String _getPlatformConnectLabel() {
    if (widget.platformConnectLabel != null) {
      return widget.platformConnectLabel!;
    }
    // Google Fit guidelines want us to use "Connect to Google Fit" instead of "Connect"
    return widget.platformName == PlatformName.googleFit
        ? 'Connect to Google Fit'
        : 'Connect';
  }

  @override
  Widget build(BuildContext context) {
    PlatformDetails platformDetails = platforms[widget.platformName]!;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Image.asset(
        platformDetails.imageUri,
        height: 32,
        width: 32,
        package: 'heka_health',
      ),
      title: Text(
        platformDetails.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: widget.state.when(
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
          '',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      trailing: widget.state.maybeWhen(
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
          onPressed: widget.state.when(
            disconnecting: (userUuid) => null,
            error: (error, userUuid) => null,
            initial: (_) => null,
            checkingConnection: (_) => null,
            noConnection: (_) => () => context
                .read<HekaConnectCubit>()
                .createConnection(platformName: widget.platformName),
            tokenInvalidated: (connection, __) => () => context
                .read<HekaConnectCubit>()
                .createConnection(platformName: widget.platformName),
            makingConnection: (_) => null,
            connected: (connection, uuid) => () =>
                context.read<HekaConnectCubit>().disconnect(uuid, connection),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 1,
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(
              horizontal:
                  widget.platformName == PlatformName.googleFit ? 12 : 24,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: widget.state.when(
            error: (error, userUuid) => const SizedBox(),
            initial: (_) => const Text(''),
            checkingConnection: (_) => const Text('...'),
            disconnecting: (_) => const Text('...'),
            noConnection: (_) {
              String label = _getPlatformConnectLabel();
              double fontSize = 16;
              if (label.length > 10) {
                fontSize = 12;
              }
              return Text(
                _getPlatformConnectLabel(),
                style: TextStyle(fontSize: fontSize),
              );
            },
            tokenInvalidated: (_, __) =>
                widget.platformName == PlatformName.googleFit
                    ? const Text(
                        'Connect to Google Fit',
                        style: TextStyle(fontSize: 12),
                      )
                    : const Text('Reconnect'),
            makingConnection: (_) => const Text('...'),
            connected: (_, __) => const Text('Disconnect'),
          ),
        ),
      ),
    );
  }
}

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            Icons.error,
            color: Colors.grey,
            size: 32,
          ),
          SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Oops! something went wrong',
                  style: TextStyle(fontSize: 16, color: Colors.red)),
              Text(
                'Failed to load the app and connections\nCheck your internet connection and try again',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
