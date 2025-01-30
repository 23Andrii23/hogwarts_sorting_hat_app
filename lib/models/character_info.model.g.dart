// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_info.model.dart';

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
      wand: json['wand'] == null
          ? null
          : WandModel.fromJson(json['wand'] as Map<String, dynamic>),
      ancestry: json['ancestry'] as String?,
      eyeColour: json['eyeColour'] as String?,
      hairColour: json['hairColour'] as String?,
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
      'wand': instance.wand,
      'ancestry': instance.ancestry,
      'eyeColour': instance.eyeColour,
      'hairColour': instance.hairColour,
      'failedAttempts': instance.failedAttempts,
      'isSucceed': instance.isSucceed,
    };
