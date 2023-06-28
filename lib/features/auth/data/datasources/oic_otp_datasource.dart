import 'dart:convert';
import 'dart:core';
import 'package:oic_next_to_you/common/data/services/api_service.dart';
import 'package:oic_next_to_you/common/data/models/genericResponse.dart';
import 'package:oic_next_to_you/features/auth/data/models/verify_otp/reqVerifyOTPModel.dart';
import 'package:oic_next_to_you/features/auth/data/models/verify_otp/resVerifyOTPModel.dart';

class OICOTP {
  late ApiService _apiService;

  OICOTP() {
    _apiService = new ApiService();
  }

  Future<resVerifyOTPModel> setRegisterOTP(reqVerifyOTPModel request) async {
    try {
      final response = await _apiService.postHttp(
          endpoint: 'register/otp', parameters: request.toJson());
      return resVerifyOTPModel.fromJson(response.data);
    } catch (_) {
      // do nothing
    }
    return resVerifyOTPModel();
  }
}
