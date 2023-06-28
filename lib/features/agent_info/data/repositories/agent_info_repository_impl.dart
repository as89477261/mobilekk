import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/agent_info/data/datasources/agent_info_datasource.dart';
import 'package:oic_next_to_you/features/agent_info/domain/entities/agent_info.dart';
import 'package:oic_next_to_you/features/agent_info/domain/repositories/agent_info_repository.dart';

class AgentInfoRepositoryImpl extends AgentInfoRepository {
  final AgentInfoDatasource agentInfoDatasource;

  AgentInfoRepositoryImpl(this.agentInfoDatasource);

  @override
  Future<AppResponse<AgentInfo>> validateAgent(String licenseId) async {
    final response = await agentInfoDatasource.validateAgent(licenseId);

    final error = response.error;
    if (error != null) {
      return AppResponse(value: null, error: error);
    }

    final model = response.value;
    if (model == null) {
      return AppResponse(
          value: null, error: const AppError(errorMessage: 'null value'));
    }

    return AppResponse(
      value: AgentInfo(
        licenseId: model.licenseId ?? '',
        name: '${model.firstName ?? ''} ${model.lastName ?? ''}',
        status: AgentStatus.fromString(model.status ?? ''),
        agentStatus: model.status ?? '',
        expireDate: model.expireDate ?? '',
        licenseType: model.licenseType ?? '',
      ),
      error: null,
    );
  }
}
