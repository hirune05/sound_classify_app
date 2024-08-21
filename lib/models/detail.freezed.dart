// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Detail _$DetailFromJson(Map<String, dynamic> json) {
  return _Detail.fromJson(json);
}

/// @nodoc
mixin _$Detail {
  double? get lat => throw _privateConstructorUsedError;
  double? get long => throw _privateConstructorUsedError;
  Map<String, double> get sounds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCopyWith<Detail> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCopyWith<$Res> {
  factory $DetailCopyWith(Detail value, $Res Function(Detail) then) =
      _$DetailCopyWithImpl<$Res, Detail>;
  @useResult
  $Res call({double? lat, double? long, Map<String, double> sounds});
}

/// @nodoc
class _$DetailCopyWithImpl<$Res, $Val extends Detail>
    implements $DetailCopyWith<$Res> {
  _$DetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
    Object? sounds = null,
  }) {
    return _then(_value.copyWith(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      sounds: null == sounds
          ? _value.sounds
          : sounds // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailImplCopyWith<$Res> implements $DetailCopyWith<$Res> {
  factory _$$DetailImplCopyWith(
          _$DetailImpl value, $Res Function(_$DetailImpl) then) =
      __$$DetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? lat, double? long, Map<String, double> sounds});
}

/// @nodoc
class __$$DetailImplCopyWithImpl<$Res>
    extends _$DetailCopyWithImpl<$Res, _$DetailImpl>
    implements _$$DetailImplCopyWith<$Res> {
  __$$DetailImplCopyWithImpl(
      _$DetailImpl _value, $Res Function(_$DetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? long = freezed,
    Object? sounds = null,
  }) {
    return _then(_$DetailImpl(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      sounds: null == sounds
          ? _value._sounds
          : sounds // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DetailImpl extends _Detail {
  const _$DetailImpl(
      {this.lat = 0,
      this.long = 0,
      final Map<String, double> sounds = const {}})
      : _sounds = sounds,
        super._();

  factory _$DetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailImplFromJson(json);

  @override
  @JsonKey()
  final double? lat;
  @override
  @JsonKey()
  final double? long;
  final Map<String, double> _sounds;
  @override
  @JsonKey()
  Map<String, double> get sounds {
    if (_sounds is EqualUnmodifiableMapView) return _sounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sounds);
  }

  @override
  String toString() {
    return 'Detail(lat: $lat, long: $long, sounds: $sounds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            const DeepCollectionEquality().equals(other._sounds, _sounds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, lat, long, const DeepCollectionEquality().hash(_sounds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      __$$DetailImplCopyWithImpl<_$DetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailImplToJson(
      this,
    );
  }
}

abstract class _Detail extends Detail {
  const factory _Detail(
      {final double? lat,
      final double? long,
      final Map<String, double> sounds}) = _$DetailImpl;
  const _Detail._() : super._();

  factory _Detail.fromJson(Map<String, dynamic> json) = _$DetailImpl.fromJson;

  @override
  double? get lat;
  @override
  double? get long;
  @override
  Map<String, double> get sounds;
  @override
  @JsonKey(ignore: true)
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
