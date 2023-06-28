import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/common/domain/entities/user/user.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/request_otp_with_phone_number.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/verify_otp_of_phone_number.dart';
import 'package:oic_next_to_you/features/auth/presentation/providers/otp_provider.dart';

import '../../../../utils/random_value.dart';
import 'otp_provider_test.mocks.dart';

@GenerateMocks([RequestOtpWithPhoneNumber, VerifyOtpAndGetUserFromPhoneNumber])
void main() {
  late MockRequestOtpWithPhoneNumber requestOtpWithPhoneNumber;
  late MockVerifyOtpAndGetUserFromPhoneNumber
      verifyOtpAndGetUserFromPhoneNumber;
  late OtpScreenProvider provider;

  setUp(() {
    requestOtpWithPhoneNumber = MockRequestOtpWithPhoneNumber();
    verifyOtpAndGetUserFromPhoneNumber =
        MockVerifyOtpAndGetUserFromPhoneNumber();
    provider = OtpScreenProvider(
      OtpUIState(),
      requestOtpWithPhoneNumber: requestOtpWithPhoneNumber,
      verifyOtpAndGetUserFromPhoneNumber: verifyOtpAndGetUserFromPhoneNumber,
    );
  });

  group('updateInputOtp', () {
    test('should update otpText state correctly', () async {
      // arrange
      var storedState = <String>[];
      provider.addListener(() {
        storedState.add(provider.state.otpText);
      });
      final otp = getRandomString(6);

      // act
      await provider.updateInputOtp(otp: otp);

      // assert
      expect(storedState, [otp]);
    });

    group('should update otpTextFormFieldState correctly', () {
      var storedState = <OtpTextFormFieldState>[];
      setUp(() {
        storedState.clear();
        provider.addListener(() {
          storedState.add(provider.state.otpTextFormFieldState);
        });
      });

      test('update to unfilled if text less than 6', () async {
        // arrange

        // act
        await provider.updateInputOtp(
            otp: getRandomString(Random().nextInt(6)));

        // assert
        expect(storedState, [OtpTextFormFieldState.unfilled]);
      });

      test('update to filled if text length at least 6', () async {
        // arrange

        // act
        await provider.updateInputOtp(otp: getRandomString(6));

        // assert
        expect(storedState, [OtpTextFormFieldState.filled]);
      });
    });
    group('should update nextButtonState correctly', () {
      var storedState = <NextButtonState>[];
      setUp(() {
        storedState.clear();
        provider.addListener(() {
          storedState.add(provider.state.nextButtonState);
        });
      });

      test('not update if current state = loading', () async {
        // arrange
        provider = OtpScreenProvider(
          OtpUIState(nextButtonState: NextButtonState.loading),
          requestOtpWithPhoneNumber: requestOtpWithPhoneNumber,
          verifyOtpAndGetUserFromPhoneNumber:
              verifyOtpAndGetUserFromPhoneNumber,
        );

        // act
        await provider.updateInputOtp(
            otp: getRandomString(Random().nextInt(6)));

        // assert
        expect(storedState, []);
      });

      test('update to disabled if text less than 6', () async {
        // arrange

        // act
        await provider.updateInputOtp(
            otp: getRandomString(Random().nextInt(6)));

        // assert
        expect(storedState, [NextButtonState.disabled]);
      });

      test('update to enabled if text length at least 6', () async {
        // arrange

        // act
        await provider.updateInputOtp(otp: getRandomString(6));

        // assert
        expect(storedState, [NextButtonState.enabled]);
      });
    });
  });

  group('requestOtp', () {
    test('should do nothing if resend button state is disabled', () async {
      // arrange
      var storedState = <ResendButtonState>[];
      provider.addListener(() {
        storedState.add(provider.state.resendButtonState);
      });
      provider = OtpScreenProvider(
        OtpUIState(resendButtonState: ResendButtonState.disabled),
        requestOtpWithPhoneNumber: requestOtpWithPhoneNumber,
        verifyOtpAndGetUserFromPhoneNumber: verifyOtpAndGetUserFromPhoneNumber,
      );
      final phoneNumber = getRandomString(10);

      // act
      await provider.requestOtp(phoneNumber: phoneNumber);

      // assert
      expect(storedState, []);
      verifyNoMoreInteractions(requestOtpWithPhoneNumber);
    });

    test(
        'should update resend button state and call requestOtp in the correct order',
        () async {
      // arrange
      var storedState = <dynamic>[];
      provider.addListener(() {
        storedState.add(provider.state.resendButtonState);
      });

      when(requestOtpWithPhoneNumber(any)).thenAnswer((_) async {
        storedState
            .add('requestOtpWithPhoneNumber(${_.positionalArguments[0]})');
        return AppResponse<bool>(value: null, error: null);
      });
      final phoneNumber = getRandomString(10);

      // act
      await provider.requestOtp(phoneNumber: phoneNumber);

      // assert
      expect(storedState, [
        ResendButtonState.disabled,
        'requestOtpWithPhoneNumber($phoneNumber)',
        ResendButtonState.enabled
      ]);
    });

    group('should update resendOtpErrorMessage according to useCase result',
        () {
      test('useCase has error should update accordingly', () async {
        // arrange
        var storedState = <String?>[];
        when(requestOtpWithPhoneNumber(any)).thenAnswer((_) => Future.value(
            AppResponse<bool>(
                value: null, error: RequestOtpError.verifyNumberFailed)));
        provider.addListener(() {
          storedState.add(provider.state.resendOtpErrorMessage);
        });

        // act
        await provider.requestOtp(phoneNumber: getRandomString(10));

        // assert
        expect(storedState, [
          null,
          RequestOtpError.verifyNumberFailed.errorMessage,
        ]);
      });
      test('useCase has no error should update as null', () async {
        // arrange
        var storedState = <String?>[];
        when(requestOtpWithPhoneNumber(any)).thenAnswer(
            (_) => Future.value(AppResponse<bool>(value: null, error: null)));
        provider.addListener(() {
          storedState.add(provider.state.resendOtpErrorMessage);
        });

        // act
        await provider.requestOtp(phoneNumber: getRandomString(10));

        // assert
        expect(storedState, [null, null]);
      });
    });
  });

  group('verifyOtp', () {
    test('should do nothing if next button state is loading', () async {
      // arrange
      provider = OtpScreenProvider(
        OtpUIState(nextButtonState: NextButtonState.loading),
        requestOtpWithPhoneNumber: requestOtpWithPhoneNumber,
        verifyOtpAndGetUserFromPhoneNumber: verifyOtpAndGetUserFromPhoneNumber,
      );
      var storedState = <NextButtonState>[];
      provider.addListener(() {
        storedState.add(provider.state.nextButtonState);
      });

      // act
      await provider.verifyOtp(phoneNumber: getRandomString(10));

      // assert
      expect(storedState, []);
    });
    test(
        'should update next button state and call verifyOtp in the correct order',
        () async {
      // arrange
      var storedState = <dynamic>[];
      final otp = getRandomString(6);
      provider = OtpScreenProvider(OtpUIState(otpText: otp),
          requestOtpWithPhoneNumber: requestOtpWithPhoneNumber,
          verifyOtpAndGetUserFromPhoneNumber:
              verifyOtpAndGetUserFromPhoneNumber);
      provider.addListener(() {
        storedState.add(provider.state.nextButtonState);
      });

      when(verifyOtpAndGetUserFromPhoneNumber(
              phoneNumber: anyNamed('phoneNumber'),
              inputOtp: anyNamed('inputOtp')))
          .thenAnswer((_) async {
        storedState.add(
            'verifyOtpAndGetUserFromPhoneNumber(${_.namedArguments[Symbol('phoneNumber')]}, ${_.namedArguments[Symbol('inputOtp')]})');
        return AppResponse<User>(value: null, error: null);
      });
      final phoneNumber = getRandomString(10);

      // act
      await provider.verifyOtp(phoneNumber: phoneNumber);

      // assert
      expect(storedState, [
        NextButtonState.loading,
        'verifyOtpAndGetUserFromPhoneNumber($phoneNumber, $otp)',
        NextButtonState.enabled
      ]);
    });

    group('should update isOtpVerified state according to useCase result', () {
      test('update as false if useCase return user null', () async {
        // arrange
        when(verifyOtpAndGetUserFromPhoneNumber(
                phoneNumber: anyNamed('phoneNumber'),
                inputOtp: anyNamed('inputOtp')))
            .thenAnswer((_) async {
          return AppResponse<User>(value: null, error: null);
        });
        var storedState = <bool>[];
        provider.addListener(() {
          storedState.add(provider.state.isOtpVerified);
        });
        // act
        await provider.verifyOtp(phoneNumber: getRandomString(10));

        // assert
        expect(storedState, [false, false]);
      });
      test('update as true if useCase return non-null user', () async {
        // arrange
        when(verifyOtpAndGetUserFromPhoneNumber(
                phoneNumber: anyNamed('phoneNumber'),
                inputOtp: anyNamed('inputOtp')))
            .thenAnswer((_) async {
          return AppResponse<User>(
              value: User(
                  id: getRandomString(20), phoneNumber: getRandomString(10)),
              error: null);
        });
        var storedState = <bool>[];
        provider.addListener(() {
          storedState.add(provider.state.isOtpVerified);
        });
        // act
        await provider.verifyOtp(phoneNumber: getRandomString(10));

        // assert
        expect(storedState, [false, true]);
      });
    });
    group(
        'should update verifyOtpErrorMessage state according to useCase error',
        () {
      test('update as null if useCase return error null', () async {
        // arrange
        when(verifyOtpAndGetUserFromPhoneNumber(
                phoneNumber: anyNamed('phoneNumber'),
                inputOtp: anyNamed('inputOtp')))
            .thenAnswer((_) async {
          return AppResponse<User>(value: null, error: null);
        });
        var storedState = <String?>[];
        provider.addListener(() {
          storedState.add(provider.state.verifyOtpErrorMessage);
        });
        // act
        await provider.verifyOtp(phoneNumber: getRandomString(10));

        // assert
        expect(storedState, [null, null]);
      });
      test('update according to useCase error message', () async {
        // arrange
        when(verifyOtpAndGetUserFromPhoneNumber(
                phoneNumber: anyNamed('phoneNumber'),
                inputOtp: anyNamed('inputOtp')))
            .thenAnswer((_) async {
          return AppResponse<User>(
            value:
                User(id: getRandomString(20), phoneNumber: getRandomString(10)),
            error: VerifyOtpError.shouldReTryRequestOtp,
          );
        });
        var storedState = <String?>[];
        provider.addListener(() {
          storedState.add(provider.state.verifyOtpErrorMessage);
        });
        // act
        await provider.verifyOtp(phoneNumber: getRandomString(10));

        // assert
        expect(storedState,
            [null, VerifyOtpError.shouldReTryRequestOtp.errorMessage]);
      });
    });
  });
}
