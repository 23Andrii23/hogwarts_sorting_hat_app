// character_info_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_info_model.freezed.dart';
part 'character_info_model.g.dart';

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
  }) = _CharacterInfo;

  factory CharacterInfo.fromJson(Map<String, dynamic> json) =>
      _$CharacterInfoFromJson(json);
}
