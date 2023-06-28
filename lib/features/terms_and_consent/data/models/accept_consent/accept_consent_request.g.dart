// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_consent_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AcceptConsentRequest _$$_AcceptConsentRequestFromJson(
        Map<String, dynamic> json) =>
    _$_AcceptConsentRequest(
      userId: json['personaL_CODE'] as String?,
      oneMeansAccept: json['iS_CONSENT_1'] as String?,
    );

Map<String, dynamic> _$$_AcceptConsentRequestToJson(
        _$_AcceptConsentRequest instance) =>
    <String, dynamic>{
      'personaL_CODE': instance.userId,
      'iS_CONSENT_1': instance.oneMeansAccept,
    };
