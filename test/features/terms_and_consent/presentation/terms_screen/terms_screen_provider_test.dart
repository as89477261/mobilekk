import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/entities/terms/terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/accept_terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/get_updated_terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/presentation/terms_screen/terms_screen_provider.dart';

import '../../../../utils/random_value.dart';
import 'terms_screen_provider_test.mocks.dart';

@GenerateMocks([GetUpdatedTerms, AcceptTerms])
void main() {
  late MockGetUpdatedTerms getUpdatedTerms;
  late MockAcceptTerms acceptTerms;
  late TermsScreenProvider provider;

  setUp(() {
    getUpdatedTerms = MockGetUpdatedTerms();
    acceptTerms = MockAcceptTerms();
    provider =
        TermsScreenProvider(TermsScreenUIState(), getUpdatedTerms, acceptTerms);
  });

  test('init should init with default TermsScreenDataStore', () {
    expect(provider.dataStore, TermsScreenDataStore());
  });

  group('getTerms', () {
    test('should do nothing if state is loading', () async {
      // arrange
      provider = TermsScreenProvider(
        TermsScreenUIState(
          getTermsState: GetTermsState.loading,
        ),
        getUpdatedTerms,
        acceptTerms,
      );

      var storedState = <TermsScreenUIState>[];
      provider.addListener(() {
        storedState.add(provider.state);
      });

      // act
      await provider.getTerms();

      // assert
      expect(storedState, []);
    });

    test(
        'should update getTermsState as loading, call '
        'getUpdatedTerms and update state as done respectively', () async {
      // arrange
      var storedState = <dynamic>[];
      provider.addListener(() {
        storedState.add(provider.state.getTermsState);
      });
      when(getUpdatedTerms()).thenAnswer((_) {
        storedState.add('getUpdatedTerms()');
        return Future.value(AppResponse<Terms>(value: null, error: null));
      });

      // act
      await provider.getTerms();

      // assert
      expect(storedState,
          [GetTermsState.loading, 'getUpdatedTerms()', GetTermsState.done]);
    });

    group('should update termsString state according to getUpdatedTerms', () {
      test('update as null if getUpdatedTerms value null', () async {
        // arrange
        when(getUpdatedTerms())
            .thenAnswer((_) => Future.value(AppResponse<Terms>(
                  value: null,
                  error: null,
                )));

        var storedState = <String?>[];
        provider.addListener(() {
          storedState.add(provider.state.termString);
        });

        // act
        await provider.getTerms();

        // assert
        expect(storedState, [null, null]);
      });

      test('update according to getUpdatedTerms Terms value', () async {
        // arrange
        final terms = getRandomString(100);
        when(getUpdatedTerms())
            .thenAnswer((_) => Future.value(AppResponse<Terms>(
                  value: Terms(terms: terms),
                  error: null,
                )));

        var storedState = <String?>[];
        provider.addListener(() {
          storedState.add(provider.state.termString);
        });

        // act
        await provider.getTerms();

        // assert
        expect(storedState, [null, terms]);
      });
    });
    group('should update getTermsError state according to getUpdatedTerms', () {
      test('update as null if getUpdatedTerms error null', () async {
        // arrange
        when(getUpdatedTerms())
            .thenAnswer((_) => Future.value(AppResponse<Terms>(
                  value: null,
                  error: null,
                )));

        var storedState = <String?>[];
        provider.addListener(() {
          storedState.add(provider.state.getTermsError);
        });

        // act
        await provider.getTerms();

        // assert
        expect(storedState, [null, null]);
      });

      test('update according to getUpdatedTerms error value', () async {
        // arrange
        when(getUpdatedTerms())
            .thenAnswer((_) => Future.value(AppResponse<Terms>(
                  value: null,
                  error: GetUpdateTermsError.getUpdateTermsFailed,
                )));

        var storedState = <String?>[];
        provider.addListener(() {
          storedState.add(provider.state.getTermsError);
        });

        // act
        await provider.getTerms();

        // assert
        expect(storedState,
            [null, GetUpdateTermsError.getUpdateTermsFailed.errorMessage]);
      });
    });

    group(
        'should update dataStore terms according to getUpdatedTerms response value',
        () {
      test('update as null if getUpdatedTerms value null', () async {
        // arrange
        when(getUpdatedTerms())
            .thenAnswer((_) => Future.value(AppResponse<Terms>(
                  value: null,
                  error: null,
                )));

        // act
        await provider.getTerms();

        // assert
        expect(provider.dataStore.terms, null);
      });

      test('update according to getUpdatedTerms Terms value', () async {
        // arrange
        final terms = getRandomString(100);
        final termsObj = Terms(terms: terms);
        when(getUpdatedTerms())
            .thenAnswer((_) => Future.value(AppResponse<Terms>(
                  value: termsObj,
                  error: null,
                )));

        // act
        await provider.getTerms();

        // assert
        expect(provider.dataStore.terms, termsObj);
      });
    });
  });

  group('acceptTerms', () {
    test('should do nothing if nextButtonState is loading', () async {
      // arrange
      provider = TermsScreenProvider(
          TermsScreenUIState(nextButtonState: NextButtonState.loading),
          getUpdatedTerms,
          acceptTerms);
      var storedState = <TermsScreenUIState>[];
      provider.addListener(() {
        storedState.add(provider.state);
      });

      // act
      await provider.acceptTerms();

      // assert
      expect(storedState, []);
    });

    test('should do nothing if terms null', () async {
      // arrange
      var storedState = <TermsScreenUIState>[];
      provider.addListener(() {
        storedState.add(provider.state);
      });

      // act
      await provider.acceptTerms();

      // assert
      expect(storedState, []);
    });

    test(
        'should update NextButtonState to loading, call acceptTerms with correct terms and update state as enable respectively',
        () async {
      // arrange
      var storedState = <dynamic>[];
      final terms = Terms(terms: getRandomString(10));
      provider = TermsScreenProvider(
          TermsScreenUIState(), getUpdatedTerms, acceptTerms,
          dataStore: TermsScreenDataStore(terms: terms));
      provider.addListener(() {
        storedState.add(provider.state.nextButtonState);
      });
      when(acceptTerms(any)).thenAnswer((_) async {
        storedState.add('acceptTerms(${_.positionalArguments[0]})');
        return AppResponse(value: null, error: null);
      });

      // act
      await provider.acceptTerms();

      // assert
      expect(storedState, [
        NextButtonState.loading,
        'acceptTerms($terms)',
        NextButtonState.enabled
      ]);
    });

    group('should update correct state according to acceptTerms value', () {
      setUp(() {
        provider = TermsScreenProvider(
            TermsScreenUIState(), getUpdatedTerms, acceptTerms,
            dataStore: TermsScreenDataStore(
                terms: Terms(terms: getRandomString(100))));
      });

      test('acceptTerms error should update correctly', () async {
        // arrange
        when(acceptTerms(any)).thenAnswer((_) async => AppResponse<bool>(
            value: null, error: AcceptTermsError.cannotAccept));

        var storedState = <TermsScreenUIState>[];
        provider.addListener(() {
          storedState.add(provider.state);
        });

        // act
        await provider.acceptTerms();

        // assert
        expect(storedState.last.isTermsAcceptSuccess, false);
        expect(
          storedState.last.acceptTermsError,
          AcceptTermsError.cannotAccept.errorMessage,
        );
      });

      test('acceptTerms success should update correctly', () async {
        // arrange
        when(acceptTerms(any)).thenAnswer(
            (_) async => AppResponse<bool>(value: true, error: null));

        var storedState = <TermsScreenUIState>[];
        provider.addListener(() {
          storedState.add(provider.state);
        });

        // act
        await provider.acceptTerms();

        // assert
        expect(storedState.last.isTermsAcceptSuccess, true);
        expect(
          storedState.last.acceptTermsError,
          null,
        );
      });
    });
  });
}
