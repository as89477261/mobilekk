import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/entities/consent/consent.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/repositories/consent_repository.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/get_updated_consent.dart';

import '../../../../utils/random_value.dart';
import 'get_updated_consent_test.mocks.dart';

@GenerateMocks([ConsentRepository])
void main() {
  late MockConsentRepository repository;
  late GetUpdatedConsent useCase;

  setUp(() {
    repository = MockConsentRepository();
    useCase = GetUpdatedConsent(repository);
  });

  test('call should call and return response from repository', () async {
    // arrange
    final consent = Consent(consent: getRandomString(10), isAllowed: Random().nextBool());
    final error = GetUpdatedConsentError(errorMessage: getRandomString(20));
    final expected = AppResponse(value: consent, error: error);
    when(repository.getUpdatedConsent()).thenAnswer(
            (_) => Future.value(expected));

    // act
    final response = await useCase();

    // assert
    expect(response, expected);
    verify(repository.getUpdatedConsent());
  });
}
