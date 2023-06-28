// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AgentInfoModel _$$_AgentInfoModelFromJson(Map<String, dynamic> json) =>
    _$_AgentInfoModel(
      licenseId: json['licenseID'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      status: json['status'] as String?,
      expireDate: json['expireDate'] as String?,
      licenseType: json['licenseType'] as String?,
    );

Map<String, dynamic> _$$_AgentInfoModelToJson(_$_AgentInfoModel instance) =>
    <String, dynamic>{
      'licenseID': instance.licenseId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'status': instance.status,
      'expireDate': instance.expireDate,
      'licenseType': instance.licenseType,
    };
