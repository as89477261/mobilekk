// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_detail_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecordDetailRequest _$$_RecordDetailRequestFromJson(
        Map<String, dynamic> json) =>
    _$_RecordDetailRequest(
      sessionId: json['sessioN_ID'] as String,
      rawText: json['raW_TEXT_PHASE'] as String,
    );

Map<String, dynamic> _$$_RecordDetailRequestToJson(
        _$_RecordDetailRequest instance) =>
    <String, dynamic>{
      'sessioN_ID': instance.sessionId,
      'raW_TEXT_PHASE': instance.rawText,
    };
