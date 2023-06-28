// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecordDetailResponse _$$_RecordDetailResponseFromJson(
        Map<String, dynamic> json) =>
    _$_RecordDetailResponse(
      id: json['id'] as String?,
      sessionId: json['sessioN_ID'] as String?,
      rawText: json['raW_TEXT_PHASE'] as String?,
      resultText: json['resulT_TEXT_PHASE'] as String?,
      oneMeansFraud: json['iS_FRUAD'] as String?,
      oneMeansRisk: json['risK_LEVEL'] as String?,
      status: json['status'] as String?,
      createdDate: json['creatE_DATE'] as String?,
      createdBy: json['creatE_BY'] as String?,
      details: (json['lisT_DETAIL'] as List<dynamic>?)
          ?.map((e) =>
              RecordDetailResponseDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecordDetailResponseToJson(
        _$_RecordDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessioN_ID': instance.sessionId,
      'raW_TEXT_PHASE': instance.rawText,
      'resulT_TEXT_PHASE': instance.resultText,
      'iS_FRUAD': instance.oneMeansFraud,
      'risK_LEVEL': instance.oneMeansRisk,
      'status': instance.status,
      'creatE_DATE': instance.createdDate,
      'creatE_BY': instance.createdBy,
      'lisT_DETAIL': instance.details,
    };
