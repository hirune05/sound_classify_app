import 'package:flutter/material.dart';
import 'package:sound_classify_app/models/detail.dart';
import 'package:sound_classify_app/services/sound_detail_service.dart';

class ShareDetailDialog extends StatelessWidget {
  const ShareDetailDialog({Key? key, required Detail this.detail})
      : super(key: key);

  final Detail detail;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('情報の共有'),
      content: const Text('音声解析の結果と場所を共有しますか？'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () async => {
            await SoundDetailService().setSoundDetail(detail),
            Navigator.of(context).pop()
          },
          child: const Text('共有'),
        ),
      ],
    );
  }
}
