import 'dart:core';
import 'package:oic_next_to_you/common/data/services/api_service.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/consent/req_consent.dart';
import 'package:oic_next_to_you/common/data/models/genericResponse.dart';

class ConsentDatasource {
  late ApiService _apiService;

  ConsentDatasource() {
    _apiService = new ApiService();
  }

  Future<GenericResponse> setConsent(reqConsent request) async {
    try {
      final response = await _apiService.postHttp(
          endpoint: 'register/consent', parameters: request.toJson());
      return GenericResponse.fromJson(response.data);
    } catch (_) {
      // do nothing
    }
    return GenericResponse();
  }
}
