import 'dart:core';
import 'package:oic_next_to_you/common/data/services/api_service.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/terms/req_term.dart';
import 'package:oic_next_to_you/common/data/models/genericResponse.dart';

class TermDatasource {
  late ApiService _apiService;

  TermDatasource() {
    _apiService = new ApiService();
  }

  Future<GenericResponse> setTerm(reqTerm request) async {
    try {
      final response = await _apiService.postHttp(
          endpoint: 'register/condition', parameters: request.toJson());
      return GenericResponse.fromJson(response.data);
    } catch (_) {
      // do nothing
    }
    return GenericResponse();
  }
}
