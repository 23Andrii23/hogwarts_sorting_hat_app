// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wand.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WandModelImpl _$$WandModelImplFromJson(Map<String, dynamic> json) =>
    _$WandModelImpl(
      wood: json['wood'] as String?,
      core: json['core'] as String?,
      length: (json['length'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$WandModelImplToJson(_$WandModelImpl instance) =>
    <String, dynamic>{
      'wood': instance.wood,
      'core': instance.core,
      'length': instance.length,
    };
