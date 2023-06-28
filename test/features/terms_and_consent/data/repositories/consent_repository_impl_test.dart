import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/common/data/datasources/internet_connection_datasource.dart';
import 'package:oic_next_to_you/common/data/models/generic_response.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_logged_in_user_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/models/logged_in_user/logged_in_user.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/accept_consent_local_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/accept_consent_network_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/consent_network_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/accept_consent/accept_consent_request.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/accept_consent/accept_consent_response.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/is_consent_allowed/is_consent_allowed.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/updated_consent/updated_consent.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/repositories/consent_repository_impl.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/entities/consent/consent.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/get_updated_consent.dart';

import '../../../../utils/random_value.dart';
import 'consent_repository_impl_test.mocks.dart';

@GenerateMocks([
  InternetConnectionDatasource,
  LocalLoggedInUserDatasource,
  AcceptConsentLocalDatasource,
  AcceptConsentNetworkDatasource,
  ConsentNetworkDatasource,
])
void main() {
  late MockInternetConnectionDatasource internetConnectionDatasource;
  late MockLocalLoggedInUserDatasource localLoggedInUserDatasource;
  late MockAcceptConsentLocalDatasource consentLocalDatasource;
  late MockAcceptConsentNetworkDatasource acceptConsentNetworkDatasource;
  late MockConsentNetworkDatasource consentNetworkDatasource;

  late ConsentRepositoryImpl repository;

  setUp(() {
    internetConnectionDatasource = MockInternetConnectionDatasource();
    when(internetConnectionDatasource.isConnected())
        .thenAnswer((_) => Future.value(true));

    localLoggedInUserDatasource = MockLocalLoggedInUserDatasource();
    when(localLoggedInUserDatasource.getLoggedInUser())
        .thenAnswer((_) =>
        Future.value(LoggedInUser(
          id: getRandomString(10),
          phoneNumber: getRandomString(10),
        )));

    consentLocalDatasource = MockAcceptConsentLocalDatasource();

    consentNetworkDatasource = MockConsentNetworkDatasource();
    when(consentNetworkDatasource.getUpdatedConsent()).thenAnswer((_) =>
        Future.value(UpdatedConsent(consentString: getRandomString(10))));

    acceptConsentNetworkDatasource = MockAcceptConsentNetworkDatasource();

    repository = ConsentRepositoryImpl(
      internetConnectionDatasource: internetConnectionDatasource,
      localLoggedInUserDatasource: localLoggedInUserDatasource,
      consentLocalDatasource: consentLocalDatasource,
      acceptConsentNetworkDatasource: acceptConsentNetworkDatasource,
      consentNetworkDatasource: consentNetworkDatasource,
    );
  });

  group('getUpdatedConsent', () {
    test('should return noInternetError if no internet', () async {
      // arrange
      when(internetConnectionDatasource.isConnected())
          .thenAnswer((_) => Future.value(false));

      // act
      final response = await repository.getUpdatedConsent();

      // assert
      expect(response,
          AppResponse<Consent>(value: null, error: AppError.noInternet));
    });

    test(
        'should return error getUpdateConsentFailed if consentNetworkRepository '
            'getUpdatedConsent throw exception', () async {
      // arrange
      when(consentNetworkDatasource.getUpdatedConsent()).thenThrow(Exception());

      // act
      final response = await repository.getUpdatedConsent();

      // assert
      expect(
          response,
          AppResponse<Consent>(
              value: null,
              error: GetUpdatedConsentError.getUpdateConsentFailed));
    });

    test(
        'should return error getUpdateConsentFailed if if consentNetworkRepository '
            'getUpdatedConsent consentString null', () async {
      // arrange
      when(consentNetworkDatasource.getUpdatedConsent())
          .thenAnswer((_) => Future.value(UpdatedConsent(consentString: null)));

      // act
      final response = await repository.getUpdatedConsent();

      // assert
      expect(
          response,
          AppResponse<Consent>(
              value: null,
              error: GetUpdatedConsentError.getUpdateConsentFailed));
    });

    test(
        'should return consent isAllowed false with consent'
            ' if localLoggedInUser null', () async {
      // arrange
      when(localLoggedInUserDatasource.getLoggedInUser())
          .thenAnswer((_) => Future.value(null));
      final consentString = getRandomString(10);
      when(consentNetworkDatasource.getUpdatedConsent()).thenAnswer(
              (_) =>
              Future.value(UpdatedConsent(consentString: consentString)));

      final consent = await consentNetworkDatasource.getUpdatedConsent();

      // act
      final response = await repository.getUpdatedConsent();

      // assert
      expect(response.value?.isAllowed, false);
      expect(response.value?.consent, consentString);
      expect(response.error, null);
    });

    test(
        'should call consentLocalDatasource getIsAllowed '
            'with correct params', () async {
      // arrange
      when(consentLocalDatasource.getAllowedConsent(userId: anyNamed('userId')))
          .thenAnswer(
              (_) => Future.value(IsConsentAllowed(isConsentAllowed: false)));
      final userId = getRandomString(10);
      when(localLoggedInUserDatasource.getLoggedInUser())
          .thenAnswer((_) =>
          Future.value(
            LoggedInUser(
              id: userId,
              phoneNumber: getRandomString(10),
            ),
          ));

      // act
      final response = await repository.getUpdatedConsent();

      // assert
      verify(consentLocalDatasource.getAllowedConsent(userId: userId));
    });

    test(
        'should return isAllowed false if consentLocalDatasource isAllowed null',
            () async {
          // arrange
          when(consentLocalDatasource.getAllowedConsent(
              userId: anyNamed('userId')))
              .thenAnswer(
                  (_) =>
                  Future.value(IsConsentAllowed(isConsentAllowed: null)));

          // act
          final response = await repository.getUpdatedConsent();

          // assert
          expect(response.value?.isAllowed, false);
        });

    test('should return isAllowed as response from consentLocalDatasource',
            () async {
          final isAllowed = Random().nextBool();
          when(consentLocalDatasource.getAllowedConsent(
              userId: anyNamed('userId')))
              .thenAnswer((_) =>
              Future.value(IsConsentAllowed(isConsentAllowed: isAllowed)));

          // act
          final response = await repository.getUpdatedConsent();

          // assert
          expect(response.value?.isAllowed, isAllowed);
        });
  });

  group('acceptConsent', () {
    test('should return false if localLoggedInUserDatasource result null',
            () async {
          // arrange
          when(localLoggedInUserDatasource.getLoggedInUser())
              .thenAnswer((_) => Future.value(null));

          // act
          final response = await repository.acceptConsent(
            Consent(
                consent: getRandomString(10), isAllowed: Random().nextBool()),
          );

          // assert
          verify(localLoggedInUserDatasource.getLoggedInUser());
          expect(response, AppResponse<bool>(value: false, error: null));
        });

    test(
        'should call local datasource acceptConsent with correct params', () async {
      // arrange
      when(consentLocalDatasource.acceptConsent(
          userId: anyNamed('userId'), isAllowed: anyNamed('isAllowed')))
          .thenAnswer((_) => Future.value(false));
      when(acceptConsentNetworkDatasource.acceptConsent(any))
          .thenAnswer((_) => Future.value(AcceptConsentResponse()));

      final userId = getRandomString(10);
      when(localLoggedInUserDatasource.getLoggedInUser())
          .thenAnswer((_) =>
          Future.value(LoggedInUser(
            id: userId,
            phoneNumber: getRandomString(10),
          )));

      final isAllowed = Random().nextBool();
      final consent =
      Consent(consent: getRandomString(10), isAllowed: isAllowed);

      // act
      await repository.acceptConsent(consent);

      // assert
      verify(
          consentLocalDatasource.acceptConsent(
              userId: userId, isAllowed: consent.isAllowed)
      );
    });
    test(
        'should call network datasource acceptConsent with correct params', () async {
      // arrange
      when(consentLocalDatasource.acceptConsent(
          userId: anyNamed('userId'), isAllowed: anyNamed('isAllowed')))
          .thenAnswer((_) => Future.value(false));
      when(acceptConsentNetworkDatasource.acceptConsent(any))
          .thenAnswer((_) => Future.value(AcceptConsentResponse()));

      final userId = getRandomString(10);
      when(localLoggedInUserDatasource.getLoggedInUser())
          .thenAnswer((_) =>
          Future.value(LoggedInUser(
            id: userId,
            phoneNumber: getRandomString(10),
          )));

      final isAllowed = Random().nextBool();
      final consent =
      Consent(consent: getRandomString(10), isAllowed: isAllowed);

      // act
      await repository.acceptConsent(consent);

      // assert
      verify(
          acceptConsentNetworkDatasource.acceptConsent(
              AcceptConsentRequest(userId: userId, oneMeansAccept: isAllowed ? "1" : "0"))
      );
    });
  });
}
