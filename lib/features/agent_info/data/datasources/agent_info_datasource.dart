import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/common/data/services/api_service.dart';
import 'package:oic_next_to_you/features/agent_info/data/models/agent_info_model.dart';

abstract class AgentInfoDatasource {
  Future<AppResponse<AgentInfoModel>> validateAgent(String licenseId);
}

class AgentInfoDatasourceImpl extends AgentInfoDatasource {
  final ApiService _apiService;

  AgentInfoDatasourceImpl(this._apiService);

  @override
  Future<AppResponse<AgentInfoModel>> validateAgent(String licenseId) async {
    try {
      final response =
          await _apiService.getHttp(endpoint: 'agent/license/$licenseId');
      final json = response.data as Map<String, dynamic>;
      if (json['licenseID'] != null) {
        return AppResponse(
          value: AgentInfoModel.fromJson(json),
          error: null,
        );
      } else {
        return AppResponse(value: null, error: AppError.unknown);
      }
    } catch (e) {
      return AppResponse(value: null, error: AppError.unknown);
    }
  }
}
