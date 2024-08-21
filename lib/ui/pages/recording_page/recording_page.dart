import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sound_classify_app/controllers/recording_page_controller.dart';
import 'package:sound_classify_app/models/detail.dart';
import 'package:sound_classify_app/thems/app_colors.dart';
import 'package:sound_classify_app/ui/components/result_text.dart';
import 'package:sound_classify_app/ui/components/share_dialog.dart';
import 'package:sound_classify_app/ui/components/small_radius_button.dart';

class RecordingPage extends ConsumerWidget {
  const RecordingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Detail? detail = ref.watch(recordingProvider).detail;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SoundFit'),
        actions: [
          ref.watch(recordingProvider).isRecordingCompleted
              ? TextButton(
                  onPressed: () {
                    ref.read(recordingProvider.notifier).determinePosition;
                    showDialog(
                      context: context,
                      builder: (context) => ShareDetailDialog(detail: detail!),
                    );
                  },
                  child: const Icon(
                    Icons.ios_share,
                    size: 40,
                    color: AppColors.secondaryText,
                  ))
              : const SizedBox(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildRecordButton(ref),
            const ResultText(),
            ref.watch(recordingProvider).isRecordingCompleted
                ? SmallRadiusPinkButton(
                    text: const Text('ARで見る'),
                    onPressed: () => context.go('/home/seeing/ar'),
                  )
                : const Text(
                    'ボタンを押してください',
                    style: TextStyle(fontSize: 32),
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildRecordButton(WidgetRef ref) {
    return MaterialButton(
      onPressed: ref.read(recordingProvider.notifier).analyseSound,
      color: ref.watch(recordingProvider).recording
          ? AppColors.gray
          : AppColors.green,
      textColor: Colors.white,
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(25),
      child: const Icon(Icons.mic, size: 60),
    );
  }
}
