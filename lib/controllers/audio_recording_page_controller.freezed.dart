// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_recording_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AudioRecordingState {
  bool get recording => throw _privateConstructorUsedError;
  bool get isRecordingCompleted => throw _privateConstructorUsedError;
  bool get isRecordUploaded => throw _privateConstructorUsedError;
  String get audioPath => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioRecordingStateCopyWith<AudioRecordingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioRecordingStateCopyWith<$Res> {
  factory $AudioRecordingStateCopyWith(
          AudioRecordingState value, $Res Function(AudioRecordingState) then) =
      _$AudioRecordingStateCopyWithImpl<$Res, AudioRecordingState>;
  @useResult
  $Res call(
      {bool recording,
      bool isRecordingCompleted,
      bool isRecordUploaded,
      String audioPath,
      String fileName});
}

/// @nodoc
class _$AudioRecordingStateCopyWithImpl<$Res, $Val extends AudioRecordingState>
    implements $AudioRecordingStateCopyWith<$Res> {
  _$AudioRecordingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recording = null,
    Object? isRecordingCompleted = null,
    Object? isRecordUploaded = null,
    Object? audioPath = null,
    Object? fileName = null,
  }) {
    return _then(_value.copyWith(
      recording: null == recording
          ? _value.recording
          : recording // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecordingCompleted: null == isRecordingCompleted
          ? _value.isRecordingCompleted
          : isRecordingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecordUploaded: null == isRecordUploaded
          ? _value.isRecordUploaded
          : isRecordUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      audioPath: null == audioPath
          ? _value.audioPath
          : audioPath // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioRecordingStateImplCopyWith<$Res>
    implements $AudioRecordingStateCopyWith<$Res> {
  factory _$$AudioRecordingStateImplCopyWith(_$AudioRecordingStateImpl value,
          $Res Function(_$AudioRecordingStateImpl) then) =
      __$$AudioRecordingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool recording,
      bool isRecordingCompleted,
      bool isRecordUploaded,
      String audioPath,
      String fileName});
}

/// @nodoc
class __$$AudioRecordingStateImplCopyWithImpl<$Res>
    extends _$AudioRecordingStateCopyWithImpl<$Res, _$AudioRecordingStateImpl>
    implements _$$AudioRecordingStateImplCopyWith<$Res> {
  __$$AudioRecordingStateImplCopyWithImpl(_$AudioRecordingStateImpl _value,
      $Res Function(_$AudioRecordingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recording = null,
    Object? isRecordingCompleted = null,
    Object? isRecordUploaded = null,
    Object? audioPath = null,
    Object? fileName = null,
  }) {
    return _then(_$AudioRecordingStateImpl(
      recording: null == recording
          ? _value.recording
          : recording // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecordingCompleted: null == isRecordingCompleted
          ? _value.isRecordingCompleted
          : isRecordingCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecordUploaded: null == isRecordUploaded
          ? _value.isRecordUploaded
          : isRecordUploaded // ignore: cast_nullable_to_non_nullable
              as bool,
      audioPath: null == audioPath
          ? _value.audioPath
          : audioPath // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AudioRecordingStateImpl implements _AudioRecordingState {
  const _$AudioRecordingStateImpl(
      {this.recording = false,
      this.isRecordingCompleted = false,
      this.isRecordUploaded = false,
      this.audioPath = '',
      this.fileName = ''});

  @override
  @JsonKey()
  final bool recording;
  @override
  @JsonKey()
  final bool isRecordingCompleted;
  @override
  @JsonKey()
  final bool isRecordUploaded;
  @override
  @JsonKey()
  final String audioPath;
  @override
  @JsonKey()
  final String fileName;

  @override
  String toString() {
    return 'AudioRecordingState(recording: $recording, isRecordingCompleted: $isRecordingCompleted, isRecordUploaded: $isRecordUploaded, audioPath: $audioPath, fileName: $fileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioRecordingStateImpl &&
            (identical(other.recording, recording) ||
                other.recording == recording) &&
            (identical(other.isRecordingCompleted, isRecordingCompleted) ||
                other.isRecordingCompleted == isRecordingCompleted) &&
            (identical(other.isRecordUploaded, isRecordUploaded) ||
                other.isRecordUploaded == isRecordUploaded) &&
            (identical(other.audioPath, audioPath) ||
                other.audioPath == audioPath) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recording, isRecordingCompleted,
      isRecordUploaded, audioPath, fileName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioRecordingStateImplCopyWith<_$AudioRecordingStateImpl> get copyWith =>
      __$$AudioRecordingStateImplCopyWithImpl<_$AudioRecordingStateImpl>(
          this, _$identity);
}

abstract class _AudioRecordingState implements AudioRecordingState {
  const factory _AudioRecordingState(
      {final bool recording,
      final bool isRecordingCompleted,
      final bool isRecordUploaded,
      final String audioPath,
      final String fileName}) = _$AudioRecordingStateImpl;

  @override
  bool get recording;
  @override
  bool get isRecordingCompleted;
  @override
  bool get isRecordUploaded;
  @override
  String get audioPath;
  @override
  String get fileName;
  @override
  @JsonKey(ignore: true)
  _$$AudioRecordingStateImplCopyWith<_$AudioRecordingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
