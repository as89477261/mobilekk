import 'package:oic_next_to_you/common/data/services/api_service.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/accept_consent/accept_consent_request.dart';

import '../models/accept_consent/accept_consent_response.dart';

abstract class AcceptConsentNetworkDatasource {
  Future<AcceptConsentResponse> acceptConsent(AcceptConsentRequest request);
}

class AcceptConsentNetworkDatasourceImpl
    implements AcceptConsentNetworkDatasource {
  final ApiService _apiService;

  AcceptConsentNetworkDatasourceImpl(this._apiService);

  @override
  Future<AcceptConsentResponse> acceptConsent(
      AcceptConsentRequest request) async {
    try {
      final response = await _apiService.postHttp(
          endpoint: 'register/consent', parameters: request.toJson());
      return AcceptConsentResponse.fromJson(response.data);
    } catch (_) {
      return AcceptConsentResponse();
    }
  }
}
