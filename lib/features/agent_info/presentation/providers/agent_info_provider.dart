import 'package:flutter/foundation.dart';
import 'package:oic_next_to_you/features/agent_info/domain/usecases/validate_agent_license_id.dart';
import 'package:oic_next_to_you/features/agent_info/presentation/providers/agent_info_ui_state.dart';

class AgentInfoProvider extends ChangeNotifier {
  final ValidateAgentLicenseId validateAgentLicenseId;

  AgentInfoUiState _state = const AgentInfoUiState.initial();

  AgentInfoUiState get state => _state;

  _setState(AgentInfoUiState updatedState) {
    if (_state != updatedState) {
      _state = updatedState;
      notifyListeners();
    }
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  _setIsloading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  AgentInfoProvider(this.validateAgentLicenseId);

  Future<void> validateAgent({required String licenseId}) async {
    _setIsloading(true);
    final response = await validateAgentLicenseId(licenseId);
    final error = response.error;
    if (error != null) {
      _setState(const AgentInfoUiState.errorInvalidAgent());
    } else {
      final agentInfo = response.value;
      _setState(
        agentInfo != null
            ? AgentInfoUiState.successValidAgent(info: agentInfo)
            : const AgentInfoUiState.errorInvalidAgent(),
      );
    }
    _setIsloading(false);
  }
}
