import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';

import '../entities/consent/consent.dart';
import '../repositories/consent_repository.dart';

class AcceptConsent {
  final ConsentRepository consentRepository;

  AcceptConsent({required this.consentRepository});

  Future<AppResponse<bool>> call(Consent consent) async {
    return await consentRepository.acceptConsent(consent);
  }
}

class AcceptConsentError extends AppError {
  const AcceptConsentError({required super.errorMessage});

  static const cannotAccept = AcceptConsentError(errorMessage:
  'ไม่สามารถยอมรับความยินยอมให้ข้อมูลในขณะนี้ กรุณาลองอีกครั้งภายหลัง');
}