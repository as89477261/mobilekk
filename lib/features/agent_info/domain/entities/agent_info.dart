import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_info.freezed.dart';

enum AgentStatus {
  expired,
  unexpired,
  unknown;

  factory AgentStatus.fromString(String value) {
    switch (value.toUpperCase()) {
      case 'Y':
        return AgentStatus.unexpired;
      case 'N':
        return AgentStatus.expired;
      default:
        return AgentStatus.unknown;
    }
  }
}

@freezed
class AgentInfo with _$AgentInfo {
  const factory AgentInfo({
    required String licenseId,
    required String name,
    required AgentStatus status,
    required String agentStatus,
    required String expireDate,
    required String licenseType,
  }) = _AgentInfo;
}
