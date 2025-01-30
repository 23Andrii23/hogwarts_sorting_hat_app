// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterInfoImpl _$$CharacterInfoImplFromJson(Map<String, dynamic> json) =>
    _$CharacterInfoImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      house: json['house'] as String?,
      image: json['image'] as String?,
      species: json['species'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      actor: json['actor'] as String?,
      patronus: json['patronus'] as String?,
      failedAttempts: (json['failedAttempts'] as num?)?.toInt() ?? 0,
      isSucceed: json['isSucceed'] as bool? ?? false,
    );

Map<String, dynamic> _$$CharacterInfoImplToJson(_$CharacterInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'house': instance.house,
      'image': instance.image,
      'species': instance.species,
      'dateOfBirth': instance.dateOfBirth,
      'actor': instance.actor,
      'patronus': instance.patronus,
      'failedAttempts': instance.failedAttempts,
      'isSucceed': instance.isSucceed,
    };
