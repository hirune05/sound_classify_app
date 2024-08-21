import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail.freezed.dart';
part 'detail.g.dart';

@freezed
class Detail with _$Detail {
  @JsonSerializable(explicitToJson: true)
  const factory Detail({
    @Default(0) double? lat,
    @Default(0) double? long,
    @Default({}) Map<String, double> sounds,
  }) = _Detail;
  const Detail._();
  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
