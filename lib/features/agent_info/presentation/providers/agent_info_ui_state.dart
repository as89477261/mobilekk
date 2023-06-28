import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oic_next_to_you/features/agent_info/domain/entities/agent_info.dart';

part 'agent_info_ui_state.freezed.dart';

@freezed
class AgentInfoUiState with _$AgentInfoUiState {
  const factory AgentInfoUiState.initial() = _Initial;
  const factory AgentInfoUiState.errorInvalidAgent() = _ErrorInvalidAgent;
  const factory AgentInfoUiState.successValidAgent({required AgentInfo info}) = _SuccessValidAgent;
}
