import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sound_classify_app/models/detail.dart';
import 'package:tflite_audio/tflite_audio.dart';
import 'package:geolocator/geolocator.dart';
part 'recording_page_controller.freezed.dart';

@freezed
class RecordingState with _$RecordingState {
  const factory RecordingState({
    @Default(false) bool recording,
    Detail? detail, //これを後にdetail.dartと連携
    @Default(false) isRecordingCompleted,
  }) = _RecordingState;
}

final recordingProvider =
    StateNotifierProvider<RecordingController, RecordingState>(
  (ref) => RecordingController(),
);

class RecordingController extends StateNotifier<RecordingState> {
  RecordingController() : super(const RecordingState()) {
    _init();
  }

  void _init() {
    TfliteAudio.loadModel(
      model: 'assets/soundclassifier.tflite',
      label: 'assets/labels.txt',
      outputRawScores: true, // Rawスコアを出力する
      numThreads: 1,
      isAsset: true,
      inputType: 'rawAudio',
    );
  }

  void init() {
    state = state.copyWith(
      recording: false,
      isRecordingCompleted: false,
    );
  }

  void startRecording() {
    const recording = true;
    state = state.copyWith(recording: recording);
  }

  Future<void> analyseSound() async {
    if (!state.recording) {
      startRecording();
      final soundsInfo = TfliteAudio.startAudioRecognition(
        numOfInferences: 1,
        sampleRate: 44100,
        bufferSize: 22016,
      );
      final sound_kinds = [
        '皿の音',
        '機械音',
        '換気扇の音',
        'キーボードの音',
        '話し声',
      ];
      final Map<String, double> sounds = {};
      soundsInfo.listen(
        (event) async {
          // ラベルリストを非同期で取得
          //final labels = await fetchLabelList();
          // recognitionResultからスコアのリストを取得
          final rawScores = json.decode(event["recognitionResult"]);
          List<double> scores = List<double>.from(rawScores);

          // スコアをパーセント表示に変換し、それぞれのラベルと結合する
          for (int i = 0; i < scores.length - 1; i++) {
            sounds.addEntries([MapEntry(sound_kinds[i], scores[i])]);
          }
          const recording = false;
          const isRecordingCompleted = true;
          state = state.copyWith(
            recording: recording,
            isRecordingCompleted: isRecordingCompleted,
            detail: Detail(sounds: sounds),
          );
        },
      );
    }
  }

  Future<List<String>> fetchLabelList() async {
    final labelData = await rootBundle.loadString('assets/labels.txt');
    return LineSplitter().convert(labelData);
  }

  void stopRecording() {
    TfliteAudio.stopAudioRecognition();
    const recording = false;
    state = state.copyWith(
      recording: recording,
    );
  }

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    final location;
    final lat;
    final long;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    location = await Geolocator.getCurrentPosition();
    lat = location.latitude;
    long = location.longitude;

    state = state.copyWith(
        detail:
            Detail(lat: lat, long: long, sounds: state.detail?.sounds ?? {}));
  }
}
