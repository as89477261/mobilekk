import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/common/data/datasources/internet_connection_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_logged_in_user_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/models/logged_in_user/logged_in_user.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/terms_local_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/terms_network_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/accept_terms/accept_terms_request.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/accept_terms/accept_terms_response.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/updated_terms/updated_terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/repositories/terms_repository_impl.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/entities/terms/terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/accept_terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/get_updated_terms.dart';

import '../../../../utils/random_value.dart';
import 'terms_repository_impl_test.mocks.dart';

@GenerateMocks([
  InternetConnectionDatasource,
  LocalLoggedInUserDatasource,
  TermsLocalDatasource,
  TermsNetworkDatasource,
])
void main() {
  late MockInternetConnectionDatasource internetConnectionDatasource;
  late LocalLoggedInUserDatasource localLoggedInUserDatasource;
  late MockTermsLocalDatasource termsLocalDatasource;
  late MockTermsNetworkDatasource termsNetworkDatasource;
  late TermsRepositoryImpl repository;

  setUp(() {
    internetConnectionDatasource = MockInternetConnectionDatasource();
    when(internetConnectionDatasource.isConnected())
        .thenAnswer((_) => Future.value(true));
    localLoggedInUserDatasource = MockLocalLoggedInUserDatasource();
    termsLocalDatasource = MockTermsLocalDatasource();
    termsNetworkDatasource = MockTermsNetworkDatasource();
    repository = TermsRepositoryImpl(
      internetConnectionDatasource: internetConnectionDatasource,
      localLoggedInUserDatasource: localLoggedInUserDatasource,
      termsLocalDatasource: termsLocalDatasource,
      termsNetworkDatasource: termsNetworkDatasource,
    );
  });

  group('getUpdatedTerms', () {
    test('should check for internet connection and return noInternet if false',
        () async {
      // arrange
      when(internetConnectionDatasource.isConnected())
          .thenAnswer((_) => Future.value(false));

      // act
      final response = await repository.getUpdatedTerms();

      // assert
      expect(response,
          AppResponse<Terms>(value: null, error: AppError.noInternet));
      verifyNoMoreInteractions(termsNetworkDatasource);
    });

    test(
        'should return getUpdateTermsFailed error if UpdateTerms termsString null',
        () async {
      // arrange
      when(termsNetworkDatasource.getUpdatedTerms())
          .thenAnswer((_) async => UpdatedTerms(termsString: null));

      // act
      final response = await repository.getUpdatedTerms();

      // assert
      expect(
          response,
          AppResponse<Terms>(
              value: null, error: GetUpdateTermsError.getUpdateTermsFailed));
    });

    test('should return response with termString value if not null', () async {
      // arrange
      final termString = getRandomString(100);
      when(termsNetworkDatasource.getUpdatedTerms())
          .thenAnswer((_) async => UpdatedTerms(termsString: termString));

      // act
      final response = await repository.getUpdatedTerms();

      // assert
      expect(
          response, AppResponse(value: Terms(terms: termString), error: null));
    });
  });

  group('acceptTerms', () {
    test(
        'acceptTerms should call termsLocalDatasource.acceptTerms with correct request',
        () async {
      // arrange
      final user = LoggedInUser(
          id: getRandomString(10), phoneNumber: getRandomString(10));
      when(localLoggedInUserDatasource.getLoggedInUser())
          .thenAnswer((_) => Future.value(user));
      when(termsLocalDatasource.acceptTerms(any))
          .thenAnswer((_) async => Future.value(AcceptTermsResponse(isSuccess: false)));
      final terms = Terms(terms: getRandomString(100));
      // act
      final response = await repository.acceptTerms(terms);

      // assert
      expect(response, AppResponse(value: true, error: null));
      verify(termsLocalDatasource
          .acceptTerms(AcceptTermsRequest(userId: user.id)));
    });

    test('acceptTerms should return false with error if loggedInUser null',
        () async {
      // arrange
      when(localLoggedInUserDatasource.getLoggedInUser())
          .thenAnswer((_) => Future.value(null));
      final terms = Terms(terms: getRandomString(100));
      // act
      final response = await repository.acceptTerms(terms);

      // assert
      expect(response,
          AppResponse(value: false, error: AcceptTermsError.cannotAccept));
      verifyNever(termsLocalDatasource.acceptTerms(any));
    });
  });
}
