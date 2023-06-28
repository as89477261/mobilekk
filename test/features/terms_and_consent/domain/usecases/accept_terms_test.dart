import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/entities/terms/terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/repositories/terms_repository.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/accept_terms.dart';

import '../../../../utils/random_value.dart';
import 'accept_terms_test.mocks.dart';

@GenerateMocks([TermsRepository])
void main() {
  late MockTermsRepository termsRepository;
  late AcceptTerms useCase;

  setUp(() {
    termsRepository = MockTermsRepository();
    useCase = AcceptTerms(termsRepository: termsRepository);
  });

  test('call should call repository and return such value', () async {
    // arrange
    final expected = AppResponse(value: Random().nextBool(), error: null);
    when(termsRepository.acceptTerms(any))
        .thenAnswer((_) => Future.value(expected));
    final terms = Terms(terms: getRandomString(100));

    // act
    final response = await useCase(terms);

    // assert
    verify(termsRepository.acceptTerms(terms));
    expect(response, expected);
  });
}
