import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/entities/consent/consent.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/accept_consent.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/get_updated_consent.dart';
import 'package:oic_next_to_you/features/terms_and_consent/presentation/consent_screen/consent_screen_provider.dart';

import '../../../../utils/random_value.dart';
import 'consent_screen_provider_test.mocks.dart';

@GenerateMocks([GetUpdatedConsent, AcceptConsent])
void main() {
  late MockGetUpdatedConsent getUpdatedConsentUsecase;
  late MockAcceptConsent acceptConsentUsecase;
  late ConsentScreenProvider provider;

  setUp(() {
    getUpdatedConsentUsecase = MockGetUpdatedConsent();
    acceptConsentUsecase = MockAcceptConsent();
    provider = ConsentScreenProvider(
      getUpdatedConsentUsecase: getUpdatedConsentUsecase,
      acceptConsentUsecase: acceptConsentUsecase,
    );
  });

  group('initialization', () {
    test('init without state should set state as default', () async {
      // arrange

      // act

      // assert
      expect(provider.state, ConsentScreenUiState());
    });

    test('init without datastore should set datastore as default', () async {
      // arrange

      // act

      // assert
      expect(provider.datastore, ConsentScreenDatastore());
    });
  });

  group('getConsent', () {
    test('should do nothing if state is loading', () async {
      // arrange
      provider = ConsentScreenProvider(
        getUpdatedConsentUsecase: getUpdatedConsentUsecase,
        acceptConsentUsecase: acceptConsentUsecase,
        state: ConsentScreenUiState(
          getConsentState: GetConsentState.loading,
        ),
      );

      // act
      await provider.getConsent();

      // assert
      verifyNoMoreInteractions(getUpdatedConsentUsecase);
    });

    test(
        'should update state to loading, call '
        'getUpdatedConsent and update to done', () async {
      // arrange
      var storedState = <dynamic>[];
      when(getUpdatedConsentUsecase()).thenAnswer((_) async {
        storedState.add('getUpdatedConsentUsecase()');
        return Future.value(AppResponse<Consent>(value: null, error: null));
      });
      provider.addListener(() {
        storedState.add(provider.state.getConsentState);
      });

      // act
      await provider.getConsent();

      // assert
      expect(storedState, [
        GetConsentState.loading,
        'getUpdatedConsentUsecase()',
        GetConsentState.done
      ]);
    });

    test(
        'should update error cannot get consent and state done'
        'if usecase throw exception', () async {
      // arrange
      when(getUpdatedConsentUsecase()).thenThrow(Exception());
      var storedState = <ConsentScreenUiState>[];
      provider.addListener(() {
        storedState.add(provider.state);
      });

      // act
      await provider.getConsent();

      // assert
      expect(
        storedState.last.getConsentError,
        GetUpdatedConsentError.getUpdateConsentFailed.errorMessage,
      );
      expect(storedState.last.getConsentState, GetConsentState.done);
    });

    test(
        'should update error message and consent value and datastore as'
        'return from usecase and status done', () async {
      // arrange
      var storedState = <ConsentScreenUiState>[];
      var storedData = <Consent?>[];
      final consent = Consent(
          consent: getRandomString(100), isAllowed: Random().nextBool());
      const error = AppError.unknown;
      when(getUpdatedConsentUsecase()).thenAnswer((_) async {
        return Future.value(AppResponse(value: consent, error: error));
      });
      provider.addListener(() {
        storedState.add(provider.state);
        storedData.add(provider.datastore.consent);
      });

      // act
      await provider.getConsent();

      // assert
      expect(storedState.last.getConsentState, GetConsentState.done);
      expect(storedState.last.getConsentError, error.errorMessage);
      expect(storedState.last.consentString, consent.consent);
      expect(storedState.last.isConsentAllowed, consent.isAllowed);
      expect(storedData.last, consent);
    });
  });

  group('acceptConsent', () {
    test('should do nothing if state is loading', () async {
      // arrange
      provider = ConsentScreenProvider(
        getUpdatedConsentUsecase: getUpdatedConsentUsecase,
        acceptConsentUsecase: acceptConsentUsecase,
        state: ConsentScreenUiState(
          acceptConsentState: AcceptConsentState.loading,
        ),
      );

      // act
      await provider.acceptConsent();

      // assert
      verifyNoMoreInteractions(acceptConsentUsecase);
    });

    test(
        'should update error to accept failed and state to done'
        'if datastore consent null', () async {
      // arrange
      var storedState = <ConsentScreenUiState>[];
      provider.addListener(() {
        storedState.add(provider.state);
      });

      // act
      await provider.acceptConsent();

      // assert
      expect(storedState.last.acceptConsentState, AcceptConsentState.done);
      expect(storedState.last.acceptConsentError,
          AcceptConsentError.cannotAccept.errorMessage);
      expect(storedState.length, 1);
      verifyZeroInteractions(acceptConsentUsecase);
    });

    test(
        'should update state to loading, call '
        'acceptConsent and update to done', () async {
      // arrange
      var storedState = <dynamic>[];
      when(acceptConsentUsecase(any)).thenAnswer((_) async {
        storedState.add('acceptConsentUsecase(${_.positionalArguments[0]})');
        return Future.value(AppResponse<bool>(value: null, error: null));
      });
      final consent = Consent(
          consent: getRandomString(100), isAllowed: Random().nextBool());
      provider = ConsentScreenProvider(
          getUpdatedConsentUsecase: getUpdatedConsentUsecase,
          acceptConsentUsecase: acceptConsentUsecase,
          datastore: ConsentScreenDatastore(consent: consent));
      provider.addListener(() {
        storedState.add(provider.state.acceptConsentState);
      });

      // act
      await provider.acceptConsent();

      // assert
      expect(storedState, [
        AcceptConsentState.loading,
        'acceptConsentUsecase(${consent})',
        AcceptConsentState.done
      ]);
    });

    test(
        'should update error message and accept success value as'
        'return from usecase and status done', () async {
      // arrange
      var storedState = <ConsentScreenUiState>[];
      final consent = Consent(
          consent: getRandomString(100), isAllowed: Random().nextBool());
      final acceptResult = Random().nextBool();
      const error = AppError.unknown;
      when(acceptConsentUsecase(any)).thenAnswer((_) async {
        return Future.value(AppResponse(value: acceptResult, error: error));
      });
      provider = ConsentScreenProvider(
          getUpdatedConsentUsecase: getUpdatedConsentUsecase,
          acceptConsentUsecase: acceptConsentUsecase,
          datastore: ConsentScreenDatastore(consent: consent));
      provider.addListener(() {
        storedState.add(provider.state);
      });

      // act
      await provider.acceptConsent();

      // assert
      expect(storedState.last.acceptConsentState, AcceptConsentState.done);
      expect(storedState.last.acceptConsentError, error.errorMessage);
      expect(storedState.last.isConsentAcceptSuccess, acceptResult);
    });
  });

  group('updateIsAllowed', () {
    test('should do nothing if stored consent null', () async {
      // arrange
      var storedState = <bool?>[];
      provider.addListener(() {
        storedState.add(provider.state.isConsentAllowed);
      });
      // act
      await provider.updateIsAllowed(Random().nextBool());

      // assert
      expect([], storedState);
      expect(null, provider.datastore.consent);
    });

    test('should update isAllowed, consent and notify listeners', () async {
      // arrange
      final isAllowed = Random().nextBool();
      var storedState = <bool?>[];
      var storedData = <Consent?>[];
      provider = ConsentScreenProvider(
          getUpdatedConsentUsecase: getUpdatedConsentUsecase,
          acceptConsentUsecase: acceptConsentUsecase,
          datastore: ConsentScreenDatastore(
              consent: Consent(
            consent: getRandomString(100),
            isAllowed: Random().nextBool(),
          )));
      provider.addListener(() {
        storedState.add(provider.state.isConsentAllowed);
        storedData.add(provider.datastore.consent);
      });

      // act
      await provider.updateIsAllowed(isAllowed);

      // assert
      expect(storedState.last, isAllowed);
      expect(storedData.last!.isAllowed, isAllowed);
    });
  });
}
