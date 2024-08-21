import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sound_classify_app/controllers/recording_page_controller.dart';

class ResultText extends ConsumerWidget {
  const ResultText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sounds = ref.watch(recordingProvider).detail?.sounds;
    List<Widget> textWidgets = [];
    sounds?.forEach((key, value) {
      textWidgets.add(
        Text(
          "$key: ${(value * 100).toStringAsFixed(2)}%",
          style: const TextStyle(fontSize: 32),
        ),
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: textWidgets,
    );
  }
}
