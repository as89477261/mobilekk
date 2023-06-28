import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/entities/terms/terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/repositories/terms_repository.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/get_updated_terms.dart';

import '../../../../utils/random_value.dart';
import 'get_updated_terms_test.mocks.dart';

@GenerateMocks([TermsRepository])
void main() {
  late MockTermsRepository repository;
  late GetUpdatedTerms useCase;

  setUp(() {
    repository = MockTermsRepository();
    useCase = GetUpdatedTerms(repository);
  });

  test('call should call and return response from repository', () async {
    // arrange
    final terms = Terms(terms: getRandomString(10));
    final error = GetUpdateTermsError(errorMessage: getRandomString(20));
    final expected = AppResponse(value: terms, error: error);
    when(repository.getUpdatedTerms()).thenAnswer(
        (_) => Future.value(expected));

    // act
    final response = await useCase();

    // assert
    expect(response, expected);
    verify(repository.getUpdatedTerms());
  });
}
