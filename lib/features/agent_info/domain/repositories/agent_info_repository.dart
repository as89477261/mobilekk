import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/agent_info/domain/entities/agent_info.dart';

abstract class AgentInfoRepository {
  Future<AppResponse<AgentInfo>> validateAgent(String licenseNumber);
}
