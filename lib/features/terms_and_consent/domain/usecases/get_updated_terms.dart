import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/repositories/terms_repository.dart';

import '../entities/terms/terms.dart';

class GetUpdatedTerms {
  final TermsRepository _termsRepository;
  GetUpdatedTerms(this._termsRepository);

  Future<AppResponse<Terms>> call() {
    return _termsRepository.getUpdatedTerms();
  }
}

class GetUpdateTermsError extends AppError {
  const GetUpdateTermsError({required super.errorMessage});

  static const getUpdateTermsFailed = GetUpdateTermsError(
      errorMessage:
          'ไม่สามารถแสดงเงื่อนไขการให้บริการในขณะนี้ กรุณาลองอีกครั้งภายหลัง',);
}
