import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';

import '../entities/consent/consent.dart';
import '../repositories/consent_repository.dart';

class GetUpdatedConsent {
  final ConsentRepository _consentRepository;
  GetUpdatedConsent(this._consentRepository);

  Future<AppResponse<Consent>> call() {
    return _consentRepository.getUpdatedConsent();
  }
}

class GetUpdatedConsentError extends AppError {
  const GetUpdatedConsentError({required super.errorMessage});

  static const getUpdateConsentFailed = GetUpdatedConsentError(
    errorMessage:
    'ไม่สามารถแสดงแบบฟอร์มความยินยอมให้ข้อมูลในขณะนี้ กรุณาลองอีกครั้งภายหลัง',);
}