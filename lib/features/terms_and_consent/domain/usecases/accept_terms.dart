import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/repositories/terms_repository.dart';

import '../entities/terms/terms.dart';

class AcceptTerms {
  final TermsRepository termsRepository;

  AcceptTerms({required this.termsRepository});

  Future<AppResponse<bool>> call(Terms terms) async {
    return await termsRepository.acceptTerms(terms);
  }
}

class AcceptTermsError extends AppError {
  const AcceptTermsError({required super.errorMessage});

  static const cannotAccept = AcceptTermsError(errorMessage:
      'ไม่สามารถยอมรับเงื่อนไขการให้บริการในขณะนี้ กรุณาลองอีกครั้งภายหลัง');
}