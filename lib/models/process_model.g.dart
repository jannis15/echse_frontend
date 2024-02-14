// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessModelImpl _$$ProcessModelImplFromJson(Map<String, dynamic> json) =>
    _$ProcessModelImpl(
      name: json['name'] as String,
      icon: const Base64StringConverter().fromJson(json['icon'] as String),
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$$ProcessModelImplToJson(_$ProcessModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': const Base64StringConverter().toJson(instance.icon),
      'duration': instance.duration,
    };
