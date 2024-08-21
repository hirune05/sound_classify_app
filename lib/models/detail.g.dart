// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailImpl _$$DetailImplFromJson(Map<String, dynamic> json) => _$DetailImpl(
      lat: (json['lat'] as num?)?.toDouble() ?? 0,
      long: (json['long'] as num?)?.toDouble() ?? 0,
      sounds: (json['sounds'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const {},
    );

Map<String, dynamic> _$$DetailImplToJson(_$DetailImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
      'sounds': instance.sounds,
    };
