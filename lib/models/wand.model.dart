import 'package:freezed_annotation/freezed_annotation.dart';

part 'wand.model.freezed.dart';
part 'wand.model.g.dart';

@freezed
class WandModel with _$WandModel {
  factory WandModel({
    required String? wood,
    required String? core,
    required double? length,
  }) = _WandModel;

  factory WandModel.fromJson(Map<String, dynamic> json) =>
      _$WandModelFromJson(json);
}
