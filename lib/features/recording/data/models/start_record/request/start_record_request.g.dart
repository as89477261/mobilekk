// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_record_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartRecordRequest _$$_StartRecordRequestFromJson(
        Map<String, dynamic> json) =>
    _$_StartRecordRequest(
      createdBy: json['creatE_BY'] as String,
      sessionId: json['sessioN_ID'] as String,
      userId: json['personaL_CODE'] as String,
    );

Map<String, dynamic> _$$_StartRecordRequestToJson(
        _$_StartRecordRequest instance) =>
    <String, dynamic>{
      'creatE_BY': instance.createdBy,
      'sessioN_ID': instance.sessionId,
      'personaL_CODE': instance.userId,
    };
