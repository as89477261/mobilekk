// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenericResponse _$$_GenericResponseFromJson(Map<String, dynamic> json) =>
    _$_GenericResponse(
      resultObj: json['resulT_OBJ'] as String?,
      resultStatus: json['resulT_STATUS'] as String?,
      resultCode: json['resulT_CODE'] as String?,
      resultMessage: json['resulT_MESSAGE'] as String?,
    );

Map<String, dynamic> _$$_GenericResponseToJson(_$_GenericResponse instance) =>
    <String, dynamic>{
      'resulT_OBJ': instance.resultObj,
      'resulT_STATUS': instance.resultStatus,
      'resulT_CODE': instance.resultCode,
      'resulT_MESSAGE': instance.resultMessage,
    };
