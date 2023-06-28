import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/features/auth/data/models/request_otp/request_otp_response.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/request_otp_with_phone_number.dart';
import 'package:oic_next_to_you/features/auth/presentation/providers/login_screen_provider.dart';

import '../../../../utils/random_value.dart';
import 'login_screen_provider_test.mocks.dart';

@GenerateMocks([RequestOtpWithPhoneNumber])
void main() {
  late MockRequestOtpWithPhoneNumber requestOtpWithPhoneNumber;
  late LoginScreenProvider provider;

  setUp(() {
    requestOtpWithPhoneNumber = MockRequestOtpWithPhoneNumber();
    provider = LoginScreenProvider(LoginScreenUIState(),
        requestOtpWithPhoneNumber: requestOtpWithPhoneNumber);
  });

  group('updatePhoneNumber', () {
    group('should update phoneNumberTextFormFieldState correctly', () {
      late var storedState;
      setUp(() {
        storedState = <PhoneNumberTextFormFieldState>[];
        provider.addListener(() {
          storedState.add(provider.state.phoneNumberTextFormFieldState);
        });
      });
      test('unfilled if phoneNumber length less than 10', () async {
        // arrange

        // act
        await provider.updatePhoneNumber(getRandomString(Random().nextInt(10)));

        // assert
        expect(storedState, [PhoneNumberTextFormFieldState.unfilled]);
      });

      test('filled if phoneNumber length is 10', () async {
        // act
        await provider.updatePhoneNumber(getRandomString(10));

        // assert
        expect(storedState, [PhoneNumberTextFormFieldState.filled]);
      });
    });

    group('should update phoneNumber state correctly', () {
      late var storedState;
      setUp(() {
        storedState = <String?>[];
        provider.addListener(() {
          storedState.add(provider.state.inputPhoneNumber);
        });
      });
      final phoneNumber = getRandomString(10);
      test('update $phoneNumber', () async {
        // arrange

        // act
        await provider.updatePhoneNumber(phoneNumber);

        // assert
        expect(storedState, [phoneNumber]);
      });
    });

    group('should update NextButtonState correctly', () {
      late var storedState;
      setUp(() {
        storedState = <NextButtonState>[];
        provider.addListener(() {
          storedState.add(provider.state.nextButtonState);
        });
      });

      test('no update if current value is loading', () async {
        // arrange
        provider = LoginScreenProvider(
            LoginScreenUIState(nextButtonState: NextButtonState.loading),
            requestOtpWithPhoneNumber: requestOtpWithPhoneNumber);

        // act
        await provider.updatePhoneNumber(getRandomString(10));

        // assert
        expect(storedState, []);
      });

      test('update as enabled if phoneNumber length = 10', () async {
        // act
        await provider.updatePhoneNumber(getRandomString(10));

        // assert
        expect(storedState, [NextButtonState.enabled]);
      });

      test('update as disabled if phoneNumber length < 10', () async {
        // act
        await provider.updatePhoneNumber(getRandomString(Random().nextInt(10)));

        // assert
        expect(storedState, [NextButtonState.disabled]);
      });
    });
  });

  group('requestOtp', () {
    test('should do nothing if button state is already loading', () async {
      // arrange
      final storedState = <dynamic>[];
      provider = LoginScreenProvider(
          LoginScreenUIState(nextButtonState: NextButtonState.loading),
          requestOtpWithPhoneNumber: requestOtpWithPhoneNumber);

      provider.addListener(() {
        storedState.add(provider.state.nextButtonState);
      });
      when(requestOtpWithPhoneNumber(any)).thenAnswer(
          (_) => Future.value(AppResponse(value: null, error: null)));

      // act
      await provider.requestOtp();

      // assert
      verifyNoMoreInteractions(requestOtpWithPhoneNumber);
      expect(storedState, []);
    });

    test(
        'should update button state as loading, call requestOtpWithPhoneNumber with the stored number, and enabled button',
        () async {
      // arrange
      final storedState = <dynamic>[];
      final phoneNumber = getRandomString(10);
      provider = LoginScreenProvider(
          LoginScreenUIState(inputPhoneNumber: phoneNumber),
          requestOtpWithPhoneNumber: requestOtpWithPhoneNumber);
      provider.addListener(() {
        storedState.add(provider.state.nextButtonState);
      });
      when(requestOtpWithPhoneNumber(any)).thenAnswer((_) async {
        storedState
            .add('requestOtpWithPhoneNumber(${_.positionalArguments[0]})');
        return AppResponse<bool>(value: null, error: null);
      });

      // act
      await provider.requestOtp();

      // assert
      verify(requestOtpWithPhoneNumber(phoneNumber));
      expect(storedState, [
        NextButtonState.loading,
        'requestOtpWithPhoneNumber($phoneNumber)',
        NextButtonState.enabled
      ]);
    });
    test('should update errorMessage if presents', () async {
      // arrange
      final initErrorMessage = getRandomString(20);
      provider = LoginScreenProvider(
          LoginScreenUIState(errorMessage: initErrorMessage),
          requestOtpWithPhoneNumber: requestOtpWithPhoneNumber);
      final error = Random().nextBool()
          ? null
          : AppError(errorMessage: getRandomString(10));
      when(requestOtpWithPhoneNumber(any)).thenAnswer(
          (_) => Future.value(AppResponse(value: false, error: error)));

      final storedState = <dynamic>[];
      provider.addListener(() {
        storedState.add(provider.state.errorMessage);
      });

      // act
      await provider.requestOtp();

      // assert
      expect(storedState, [initErrorMessage, error?.errorMessage]);
    });

    test('should update isPhoneNumberValidated according to useCase value',
        () async {
      final responseValue = Random().nextBool();
      when(requestOtpWithPhoneNumber(any)).thenAnswer(
          (_) => Future.value(AppResponse(value: responseValue, error: null)));

      final storedState = <dynamic>[];
      provider.addListener(() {
        storedState.add(provider.state.isPhoneNumberValidated);
      });

      // act
      await provider.requestOtp();

      // assert
      expect(storedState, [false, responseValue]);
    });
  });
}
