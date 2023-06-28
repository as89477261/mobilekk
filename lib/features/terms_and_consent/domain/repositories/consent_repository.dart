import 'package:oic_next_to_you/common/core/app_response.dart';

import '../entities/consent/consent.dart';

abstract class ConsentRepository {
  Future<AppResponse<Consent>> getUpdatedConsent();
  Future<AppResponse<bool>> acceptConsent(Consent consent);
}