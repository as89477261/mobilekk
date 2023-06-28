import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_info_model.freezed.dart';
part 'agent_info_model.g.dart';

@freezed
class AgentInfoModel with _$AgentInfoModel {
  const factory AgentInfoModel({
    @JsonKey(name: 'licenseID') required String? licenseId,
    required String? firstName,
    required String? lastName,
    required String? status,
    required String? expireDate,
    required String? licenseType,
  }) = _AgentInfoModel;

  factory AgentInfoModel.fromJson(Map<String, dynamic> json) => _$AgentInfoModelFromJson(json);
}
