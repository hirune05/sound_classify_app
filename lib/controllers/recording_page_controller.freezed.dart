// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recording_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecordingState {
  bool get recording => throw _privateConstructorUsedError;
  Detail? get detail =>
      throw _privateConstructorUsedError; //これを後にdetail.dartと連携
  dynamic get isRecordingCompleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordingStateCopyWith<RecordingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordingStateCopyWith<$Res> {
  factory $RecordingStateCopyWith(
          RecordingState value, $Res Function(RecordingState) then) =
      _$RecordingStateCopyWithImpl<$Res, RecordingState>;
  @useResult
  $Res call({bool recording, Detail? detail, dynamic isRecordingCompleted});

  $DetailCopyWith<$Res>? get detail;
}

/// @nodoc
class _$RecordingStateCopyWithImpl<$Res, $Val extends RecordingState>
    implements $RecordingStateCopyWith<$Res> {
  _$RecordingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recording = null,
    Object? detail = freezed,
    Object? isRecordingCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      recording: null == recording
          ? _value.recording
          : recording // ignore: cast_nullable_to_non_nullable
              as bool,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Detail?,
      isRecordingCompleted: freezed == isRecordingCompleted
          ? _value.isRecordingCompleted
          : isRecordingCompleted // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailCopyWith<$Res>? get detail {
    if (_value.detail == null) {
      return null;
    }

    return $DetailCopyWith<$Res>(_value.detail!, (value) {
      return _then(_value.copyWith(detail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecordingStateImplCopyWith<$Res>
    implements $RecordingStateCopyWith<$Res> {
  factory _$$RecordingStateImplCopyWith(_$RecordingStateImpl value,
          $Res Function(_$RecordingStateImpl) then) =
      __$$RecordingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool recording, Detail? detail, dynamic isRecordingCompleted});

  @override
  $DetailCopyWith<$Res>? get detail;
}

/// @nodoc
class __$$RecordingStateImplCopyWithImpl<$Res>
    extends _$RecordingStateCopyWithImpl<$Res, _$RecordingStateImpl>
    implements _$$RecordingStateImplCopyWith<$Res> {
  __$$RecordingStateImplCopyWithImpl(
      _$RecordingStateImpl _value, $Res Function(_$RecordingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recording = null,
    Object? detail = freezed,
    Object? isRecordingCompleted = freezed,
  }) {
    return _then(_$RecordingStateImpl(
      recording: null == recording
          ? _value.recording
          : recording // ignore: cast_nullable_to_non_nullable
              as bool,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Detail?,
      isRecordingCompleted: freezed == isRecordingCompleted
          ? _value.isRecordingCompleted!
          : isRecordingCompleted,
    ));
  }
}

/// @nodoc

class _$RecordingStateImpl implements _RecordingState {
  const _$RecordingStateImpl(
      {this.recording = false, this.detail, this.isRecordingCompleted = false});

  @override
  @JsonKey()
  final bool recording;
  @override
  final Detail? detail;
//これを後にdetail.dartと連携
  @override
  @JsonKey()
  final dynamic isRecordingCompleted;

  @override
  String toString() {
    return 'RecordingState(recording: $recording, detail: $detail, isRecordingCompleted: $isRecordingCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingStateImpl &&
            (identical(other.recording, recording) ||
                other.recording == recording) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            const DeepCollectionEquality()
                .equals(other.isRecordingCompleted, isRecordingCompleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recording, detail,
      const DeepCollectionEquality().hash(isRecordingCompleted));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingStateImplCopyWith<_$RecordingStateImpl> get copyWith =>
      __$$RecordingStateImplCopyWithImpl<_$RecordingStateImpl>(
          this, _$identity);
}

abstract class _RecordingState implements RecordingState {
  const factory _RecordingState(
      {final bool recording,
      final Detail? detail,
      final dynamic isRecordingCompleted}) = _$RecordingStateImpl;

  @override
  bool get recording;
  @override
  Detail? get detail;
  @override //これを後にdetail.dartと連携
  dynamic get isRecordingCompleted;
  @override
  @JsonKey(ignore: true)
  _$$RecordingStateImplCopyWith<_$RecordingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
