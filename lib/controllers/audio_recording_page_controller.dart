import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart' as ap;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

part 'audio_recording_page_controller.freezed.dart';

@freezed
class AudioRecordingState with _$AudioRecordingState {
  const factory AudioRecordingState({
    @Default(false) bool recording,
    @Default(false) bool isRecordingCompleted,
    @Default(false) bool isRecordUploaded,
    @Default(false) bool isProcessing,
    @Default(false) bool isProcessed,
    @Default(false) bool isProcessingFailed,
    @Default('') String audioPath,
    @Default('') String fileName,
  }) = _AudioRecordingState;
}

final audioRecordingProvider =
    StateNotifierProvider<AudioRecordingController, AudioRecordingState>(
  (ref) => AudioRecordingController(),
);

class AudioRecordingController extends StateNotifier<AudioRecordingState> {
  AudioRecordingController() : super(const AudioRecordingState()) {
    _init();
  }

  late Record audioRecord;
  late ap.AudioPlayer audioPlayer;

  Timer? _timer;
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? _processingSub;
  Timer? _processingTimeout;

  void _init() {
    audioPlayer = ap.AudioPlayer();
    audioRecord = Record();
    state = state.copyWith(
      recording: false,
      isRecordingCompleted: false,
      isProcessing: false,
      isProcessed: false,
      isProcessingFailed: false,
    );
  }

  void init() {
    state = state.copyWith(
      recording: false,
      isRecordingCompleted: false,
      isProcessing: false,
      isProcessed: false,
      isProcessingFailed: false,
    );
  }

  void startRecording() async {
    const recording = true;
    state = state.copyWith(recording: recording);
    try {
      if (await audioRecord.hasPermission()) {
        // Start recording to file
        await audioRecord.start();
        _timer = Timer(const Duration(seconds: 3), () {
          stopRecording();
        });
      }
    } catch (e) {
      print('Error Start Recording:$e');
    }
  }

  void stopRecording() async {
    try {
      String? path = await audioRecord.stop();
      print('✅AudioPath: $path');
      if (path != null) {
        // "file://"スキームを削除
        final uri = Uri.parse(path);
        final correctPath = uri.toFilePath();

        // 一時ディレクトリのパスを取得
        final directory = await getTemporaryDirectory();
        final newPath = '${directory.path}/record.m4a';

        // コピー先のディレクトリを作成
        final newFile = File(newPath);
        if (!(await newFile.parent.exists())) {
          await newFile.parent.create(recursive: true);
        }

        // ファイルをコピー
        final file = File(correctPath);
        await file.copy(newPath);

        state = state.copyWith(
          recording: false,
          isRecordingCompleted: true,
          audioPath: newPath,
          isRecordUploaded: false,
          isProcessing: false,
          isProcessed: false,
          isProcessingFailed: false,
        );
      }
    } catch (e) {
      print('Error Stop Recording:$e');
    }
  }

  Future<void> playRecording() async {
    try {
      // ファイルの存在を確認
      final file = File(state.audioPath);
      if (await file.exists()) {
        // パーミッションを確認
        final permissions = await file.stat();
        print('File permissions: ${permissions.modeString()}');

        // AudioPlayerを再初期化
        audioPlayer = ap.AudioPlayer();

        // ソースURLが有効か確認
        final urlSource =
            ap.DeviceFileSource(state.audioPath); // UrlSourceをDeviceFileSourceに変更
        await audioPlayer.play(urlSource);
      } else {
        print('Error: Audio file does not exist at ${state.audioPath}');
      }
    } catch (e) {
      print('Error Play Recording:$e');
    }
  }

  Future<void> uploadAudioFile() async {
    try {
      state = state.copyWith(
        isProcessing: true,
        isProcessed: false,
        isProcessingFailed: false,
      );
      // UUIDを生成
      var uuid = Uuid();
      String uniqueFileName = uuid.v4();

      // タイムスタンプを使ってファイル名をユニークにする
      String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      String fileName = 'record_${uniqueFileName}_$timestamp.m4a';
      state = state.copyWith(fileName: fileName);

      // ファイルをアップロード
      File file = File(state.audioPath);
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('audio_files/$fileName');
      UploadTask uploadTask = ref.putFile(file);
      await uploadTask;
      print('File uploaded to Firebase Storage');
      state = state.copyWith(
        isRecordUploaded: true,
        isProcessing: true,
        isProcessed: false,
        isProcessingFailed: false,
      );

      await FirebaseFirestore.instance
          .collection('audio_processing')
          .doc(fileName)
          .set({
        'status': 'uploaded',
        'originalPath': 'audio_files/$fileName',
        'editedPath': 'edited_audio_files/edited_$fileName',
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      await _startProcessingWatcher(fileName);
    } catch (e) {
      print('Error uploading file: $e');
      state = state.copyWith(
        isProcessing: false,
        isProcessed: false,
        isProcessingFailed: true,
      );
    }
  }

  Future<void> _startProcessingWatcher(String fileName) async {
    await _processingSub?.cancel();
    _processingTimeout?.cancel();
    final docRef =
        FirebaseFirestore.instance.collection('audio_processing').doc(fileName);
    _processingTimeout = Timer(const Duration(seconds: 90), () {
      state = state.copyWith(
        isProcessing: false,
        isProcessed: false,
        isProcessingFailed: true,
      );
      _processingSub?.cancel();
    });
    _processingSub = docRef.snapshots().listen((snapshot) {
      if (!snapshot.exists) {
        return;
      }
      final data = snapshot.data();
      final status = data?['status'];
      if (status == 'completed') {
        state = state.copyWith(
          isProcessing: false,
          isProcessed: true,
          isProcessingFailed: false,
        );
        _processingTimeout?.cancel();
        _processingSub?.cancel();
      } else if (status == 'failed') {
        state = state.copyWith(
          isProcessing: false,
          isProcessed: false,
          isProcessingFailed: true,
        );
        _processingTimeout?.cancel();
        _processingSub?.cancel();
      } else {
        state = state.copyWith(isProcessing: true, isProcessingFailed: false);
      }
    });
  }

  Future<void> _waitForProcessingComplete(String fileName) async {
    const timeout = Duration(seconds: 90);
    final docRef =
        FirebaseFirestore.instance.collection('audio_processing').doc(fileName);
    final completer = Completer<void>();
    late final StreamSubscription<DocumentSnapshot<Map<String, dynamic>>> sub;
    sub = docRef.snapshots().listen((snapshot) {
      if (!snapshot.exists) {
        return;
      }
      final data = snapshot.data();
      final status = data?['status'];
      if (status == 'completed') {
        completer.complete();
      } else if (status == 'failed') {
        completer.completeError(Exception('processing failed'));
      }
    });
    try {
      await completer.future.timeout(timeout);
    } finally {
      await sub.cancel();
    }
  }

  Future<void> downloadAndPlayAudioFile() async {
    try {
      String fileName = state.fileName;
      if (fileName.isEmpty) {
        print('Error: fileName is empty, upload first.');
        return;
      }
      await _waitForProcessingComplete(fileName);
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref =
          storage.ref().child('edited_audio_files/edited_$fileName');

      final Directory systemTempDir = Directory.systemTemp;
      final File tempFile = File('${systemTempDir.path}/record.m4a');
      if (tempFile.existsSync()) {
        await tempFile.delete();
      }
      await ref.writeToFile(tempFile);
      print('Processed file downloaded from Firebase Storage');

      // ダウンロードしたファイルを再生
      final urlSource = ap.DeviceFileSource(tempFile.path);
      await audioPlayer.play(urlSource);

      // 再生後にファイルを削除
      // await ref.delete();
      // print('File deleted from Firebase Storage');
    } catch (e) {
      print('Error downloading or playing file: $e');
    }
  }
}
