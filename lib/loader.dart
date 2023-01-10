import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String text;
  const Loader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox.square(
            dimension: 16,
            child: CircularProgressIndicator(),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );
  }
}
