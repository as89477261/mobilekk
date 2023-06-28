import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/entities/consent/consent.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/repositories/consent_repository.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/accept_consent.dart';

import '../../../../utils/random_value.dart';
import 'accept_consent_test.mocks.dart';

@GenerateMocks([ConsentRepository])
void main() {
  late MockConsentRepository consentRepository;
  late AcceptConsent useCase;

  setUp(() {
    consentRepository = MockConsentRepository();
    useCase = AcceptConsent(consentRepository: consentRepository);
  });

  test('call should call repository and return such value', () async {
    // arrange
    final expected = AppResponse(value: Random().nextBool(), error: null);
    when(consentRepository.acceptConsent(any))
        .thenAnswer((_) => Future.value(expected));
    final consent = Consent(
      consent: getRandomString(100),
      isAllowed: Random().nextBool(),
    );

    // act
    final response = await useCase(consent);

    // assert
    verify(consentRepository.acceptConsent(consent));
    expect(response, expected);
  });
}
