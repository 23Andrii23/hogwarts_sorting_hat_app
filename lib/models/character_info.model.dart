import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hogwarts/models/wand.model.dart';

part 'character_info.model.freezed.dart';
part 'character_info.model.g.dart';

@freezed
class CharacterInfo with _$CharacterInfo {
  factory CharacterInfo({
    required String id,
    required String? name,
    required String? house,
    required String? image,
    required String? species,
    required String? dateOfBirth,
    required String? actor,
    required String? patronus,
    required WandModel? wand,
    required String? ancestry,
    required String? eyeColour,
    required String? hairColour,
    @Default(0) int failedAttempts,
    @Default(false) bool isSucceed,
  }) = _CharacterInfo;

  factory CharacterInfo.fromJson(Map<String, dynamic> json) =>
      _$CharacterInfoFromJson(json);
}
