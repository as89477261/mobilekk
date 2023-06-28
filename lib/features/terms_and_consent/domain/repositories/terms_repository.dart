import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/get_updated_terms.dart';

import '../entities/terms/terms.dart';

abstract class TermsRepository {
  Future<AppResponse<Terms>> getUpdatedTerms();
  Future<AppResponse<bool>> acceptTerms(Terms terms);
}