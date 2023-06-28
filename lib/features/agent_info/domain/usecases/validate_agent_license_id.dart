import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/agent_info/domain/entities/agent_info.dart';
import 'package:oic_next_to_you/features/agent_info/domain/repositories/agent_info_repository.dart';

class ValidateAgentLicenseId {
  final AgentInfoRepository repository;

  ValidateAgentLicenseId(this.repository);

  Future<AppResponse<AgentInfo>> call(String licenseId) {
    return repository.validateAgent(licenseId);
  }
}
