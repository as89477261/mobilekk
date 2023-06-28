import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/common/data/datasources/internet_connection_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_credential_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/network_otp_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/models/request_otp/request_otp_request.dart';
import 'package:oic_next_to_you/features/auth/data/models/request_otp/request_otp_response.dart';
import 'package:oic_next_to_you/features/auth/data/models/verify_otp/verify_otp_request.dart';
import 'package:oic_next_to_you/features/auth/data/models/verify_otp/verify_otp_response.dart';
import 'package:oic_next_to_you/features/auth/data/repositories/otp_repository_impl.dart';
import 'package:oic_next_to_you/features/auth/domain/repositories/user_repository.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/request_otp_with_phone_number.dart';
import 'package:oic_next_to_you/common/domain/entities/user/user.dart'
    as entityUser;
import 'package:oic_next_to_you/features/auth/domain/usecases/verify_otp_of_phone_number.dart';

import '../../../../utils/random_value.dart';
import 'otp_repository_impl_test.mocks.dart';

typedef FirebaseUser = User;

@GenerateMocks([
  InternetConnectionDatasource,
  LocalVerificationIdDatasource,
  NetworkOtpDatasource,
  UserRepository,
  FirebaseAuthException,
  PhoneAuthCredential,
  UserCredential,
  User,
])
void main() {
  late MockNetworkOtpDatasource datasource;
  late MockInternetConnectionDatasource internetConnectionDatasource;
  late MockLocalVerificationIdDatasource localVerificationIdDatasource;
  late MockUserRepository userRepository;
  late OtpRepositoryImpl repository;
  setUp(() {
    internetConnectionDatasource = MockInternetConnectionDatasource();
    when(internetConnectionDatasource.isConnected())
        .thenAnswer((_) => Future.value(true));

    localVerificationIdDatasource = MockLocalVerificationIdDatasource();
    when(localVerificationIdDatasource.setVerificationIdOfPhoneNumber(
            phoneNumber: anyNamed('phoneNumber'),
            verificationId: anyNamed('verificationId')))
        .thenReturn(dynamic);

    datasource = MockNetworkOtpDatasource();
    when(datasource.verifyOtp(any)).thenAnswer((_) => Future.value(
      VerifyOtpResponse()
    ));

    userRepository = MockUserRepository();
    when(userRepository.setLoggedInUser(any)).thenAnswer((_) => Future.value(true));

    repository = OtpRepositoryImpl(
      internetConnectionDatasource: internetConnectionDatasource,
      localVerificationIdDatasource: localVerificationIdDatasource,
      networkOtpDatasource: datasource,
      userRepository: userRepository,
    );
  });

  group('requestOtpWithPhoneNumber', () {
    test('should return error noInternet if no internet connection', () async {
      // arrange
      final phoneNumber = getRandomString(10);
      when(internetConnectionDatasource.isConnected())
          .thenAnswer((_) => Future.value(false));

      // act
      final response =
          await repository.requestOtpWithPhoneNumber(phoneNumber: phoneNumber);

      // assert
      expect(
          response, AppResponse<bool>(value: null, error: AppError.noInternet));
      verifyNever(datasource.requestOtp(any));
    });

    test('should call datasource requestOtp with correct request', () async {
      // arrange
      final phoneNumber = '0${getRandomString(9)}';
      final formattedPhoneNumber = phoneNumber.replaceFirst('0', '+66');
      when(datasource.requestOtp(any)).thenAnswer((_) async {
        return Future.value(RequestOtpResponse());
      });

      // act
      await repository.requestOtpWithPhoneNumber(phoneNumber: phoneNumber);

      // assert
      verify(
          datasource.requestOtp(RequestOtpRequest(phoneNumber: formattedPhoneNumber)));
    });

    test(
        'should cache verificationId and return true if datasource verificationId is not null',
        () async {
      // arrange
      final verificationId = getRandomString(10);
      when(datasource.requestOtp(any)).thenAnswer((_) => Future.value(
          RequestOtpResponse(verificationId: verificationId)));
      final phoneNumber = getRandomString(10);

      // act
      final response =
          await repository.requestOtpWithPhoneNumber(phoneNumber: phoneNumber);

      // assert
      verify(localVerificationIdDatasource.setVerificationIdOfPhoneNumber(
        phoneNumber: phoneNumber,
        verificationId: verificationId,
      ));
      expect(response, AppResponse(value: true, error: null));
    });

    test('should return false with verifyFailed error if exception is not null',
        () async {
      // arrange
      final mockException = MockFirebaseAuthException();
      when(mockException.message).thenReturn(getRandomString(8));
      when(datasource.requestOtp(any)).thenAnswer(
          (_) => Future.value(RequestOtpResponse(exception: mockException)));

      // act
      final response = await repository.requestOtpWithPhoneNumber(
          phoneNumber: getRandomString(10));

      // assert
      expect(response,
          AppResponse(value: false, error: RequestOtpError.verifyNumberFailed));
    });

    test('should return false with timeout error if isTimeout true', () async {
      // arrange
      when(datasource.requestOtp(any))
          .thenAnswer((_) => Future.value(RequestOtpResponse(isTimeout: true)));

      // act
      final response = await repository.requestOtpWithPhoneNumber(
          phoneNumber: getRandomString(10));

      // assert
      expect(
          response, AppResponse(value: false, error: RequestOtpError.timeout));
    });

    test('should return false with unknown error if verificationId null otherwise',
        () async {
      // arrange
      when(datasource.requestOtp(any))
          .thenAnswer((_) => Future.value(RequestOtpResponse()));

      // act
      final response = await repository.requestOtpWithPhoneNumber(
          phoneNumber: getRandomString(10));

      // assert
      expect(response, AppResponse(value: false, error: AppError.unknown));
    });
  });

  group('verifyOtpAndGetUser', () {
    setUp(() {
      final mockFirebaseUser = MockUser();
      final mockId = getRandomString(20);
      when(mockFirebaseUser.uid).thenReturn(mockId);
      final mockNumber = getRandomString(10);
      when(mockFirebaseUser.phoneNumber).thenReturn(mockNumber);

      final verificationCode = getRandomString(20);
      final mockCredential = MockUserCredential();
      when(mockCredential.user).thenAnswer((_) => mockFirebaseUser);

      when(datasource.verifyOtp(any)).thenAnswer(
          (_) async => Future.value(VerifyOtpResponse(credential: mockCredential)));

      when(localVerificationIdDatasource.getVerificationIdOfPhoneNumber(any))
          .thenReturn(verificationCode);
    });

    test('should return noInternet error if no internet', () async {
      // arrange
      when(internetConnectionDatasource.isConnected())
          .thenAnswer((_) => Future.value(false));

      // act
      final response = await repository.verifyOtpAndGetUser(
          phoneNumber: getRandomString(10), otp: getRandomString(6));

      // assert
      expect(
          response,
          AppResponse<entityUser.User>(
              value: null, error: AppError.noInternet));
    });

    test(
        'should call datasource getVerificationIdOfPhoneNumber with number and verifyOtp with correct input',
        () async {
      // arrange
      final verificationId = getRandomString(10);
      when(localVerificationIdDatasource.getVerificationIdOfPhoneNumber(any))
          .thenReturn(verificationId);

      final phoneNumber = getRandomString(10);
      final otp = getRandomString(6);

      // act
      await repository.verifyOtpAndGetUser(phoneNumber: phoneNumber, otp: otp);

      // assert
      verifyInOrder([
        localVerificationIdDatasource.getVerificationIdOfPhoneNumber(phoneNumber),
        datasource.verifyOtp(VerifyOtpRequest(verificationCode: verificationId, otp: otp))
      ]);
    });

    test(
        'should not call datasource verifyOtp and return cannotValidateOtp if credential null',
        () async {
      // arrange
      when(localVerificationIdDatasource.getVerificationIdOfPhoneNumber(any))
          .thenReturn(null);

      final phoneNumber = getRandomString(10);
      final otp = getRandomString(6);

      // act
      final response = await repository.verifyOtpAndGetUser(
          phoneNumber: phoneNumber, otp: otp);

      // assert
      expect(
          response,
          AppResponse<entityUser.User>(
              value: null, error: VerifyOtpError.shouldReTryRequestOtp));
      verifyNever(datasource.verifyOtp(any));
    });

    group('if credential is not null', () {
      final mockId = getRandomString(20);
      final mockNumber = getRandomString(10);

      setUp(() {
        final mockFirebaseUser = MockUser();
        when(mockFirebaseUser.uid).thenReturn(mockId);
        when(mockFirebaseUser.phoneNumber).thenReturn(mockNumber);

        final credential = MockUserCredential();
        when(credential.user).thenReturn(mockFirebaseUser);

        when(datasource.verifyOtp(any)).thenAnswer((_) async =>
            Future.value(VerifyOtpResponse(credential: credential)));
      });

      test('should call user repository storeLoggedInUser with correct value',
          () async {
        // arrange

        // act
        final response = await repository.verifyOtpAndGetUser(
            phoneNumber: getRandomString(10), otp: getRandomString(6));

        // assert
        verify(userRepository.setLoggedInUser(
            entityUser.User(id: mockId, phoneNumber: mockNumber)));
      });

      test('should return a created user with id and phoneNumber', () async {
        // arrange

        // act
        final response = await repository.verifyOtpAndGetUser(
            phoneNumber: getRandomString(10), otp: getRandomString(6));

        // assert
        expect(
            response,
            AppResponse(
                value: entityUser.User(id: mockId, phoneNumber: mockNumber),
                error: null));
      });
    });

    test(
        'should return noCredential error if credential null without exception',
        () async {
      // arrange
      when(datasource.verifyOtp(any)).thenAnswer(
          (_) async => Future.value(VerifyOtpResponse(credential: null)));

      // act
      final response = await repository.verifyOtpAndGetUser(
          phoneNumber: getRandomString(10), otp: getRandomString(6));

      // assert
      expect(
          response,
          AppResponse<entityUser.User>(
              value: null, error: VerifyOtpError.shouldRetrySubmitOtp));
    });

    group('if has FirebaseAuthException', () {
      /// - **invalid-credential**:
      ///  - Thrown if the credential is malformed or has expired.
      test(' **invalid-credential**: should return shouldReTryRequestOtp',
          () async {
        // arrange
        when(datasource.verifyOtp(any)).thenAnswer((_) => Future.value(
            VerifyOtpResponse(
                exception: FirebaseAuthException(code: 'invalid-credential'))));

        // act
        final response = await repository.verifyOtpAndGetUser(
            phoneNumber: getRandomString(10), otp: getRandomString(6));

        // assert
        expect(
            response,
            AppResponse<entityUser.User>(
                value: null, error: VerifyOtpError.shouldReTryRequestOtp));
      });

      /// - **user-disabled**:
      ///  - Thrown if the user corresponding to the given credential has been
      ///    disabled.
      test(' **user-disabled**:: should return shouldContactAdmin', () async {
        // arrange
        when(datasource.verifyOtp(any)).thenAnswer((_) => Future.value(
            VerifyOtpResponse(
                exception: FirebaseAuthException(code: 'user-disabled'))));

        // act
        final response = await repository.verifyOtpAndGetUser(
            phoneNumber: getRandomString(10), otp: getRandomString(6));

        // assert
        expect(
            response,
            AppResponse<entityUser.User>(
                value: null, error: VerifyOtpError.shouldContactAdmin));
      });

      /// - **operation-not-allowed**:
      ///  - Thrown if the type of account corresponding to the credential is not
      ///    enabled. Enable the account type in the Firebase Console, under the
      ///    Auth tab.
      test(' **operation-not-allowed**:: should return shouldContactAdmin',
          () async {
        // arrange
        when(datasource.verifyOtp(any)).thenAnswer((_) => Future.value(
            VerifyOtpResponse(
                exception:
                    FirebaseAuthException(code: 'operation-not-allowed'))));

        // act
        final response = await repository.verifyOtpAndGetUser(
            phoneNumber: getRandomString(10), otp: getRandomString(6));

        // assert
        expect(
            response,
            AppResponse<entityUser.User>(
                value: null, error: VerifyOtpError.shouldContactAdmin));
      });

      /// - **invalid-verification-code**:
      ///  - Thrown if the credential is a [PhoneAuthProvider.credential] and the
      ///    verification code of the credential is not valid.
      test(' **invalid-verification-code**:: should return incorrectOtp',
          () async {
        // arrange
        when(datasource.verifyOtp(any)).thenAnswer((_) => Future.value(
            VerifyOtpResponse(
                exception:
                    FirebaseAuthException(code: 'invalid-verification-code'))));

        // act
        final response = await repository.verifyOtpAndGetUser(
            phoneNumber: getRandomString(10), otp: getRandomString(6));

        // assert
        expect(
            response,
            AppResponse<entityUser.User>(
                value: null, error: VerifyOtpError.incorrectOtp));
      });

      /// - **invalid-verification-id**:
      ///  - Thrown if the credential is a [PhoneAuthProvider.credential] and the
      ///    verification ID of the credential is not valid.id.
      test(' **invalid-verification-id**:: should return shouldReTryRequestOtp',
          () async {
        // arrange
        when(datasource.verifyOtp(any)).thenAnswer((_) => Future.value(
            VerifyOtpResponse(
                exception:
                    FirebaseAuthException(code: 'invalid-verification-id'))));

        // act
        final response = await repository.verifyOtpAndGetUser(
            phoneNumber: getRandomString(10), otp: getRandomString(6));

        // assert
        expect(
            response,
            AppResponse<entityUser.User>(
                value: null, error: VerifyOtpError.shouldReTryRequestOtp));
      });
    });
  });
}
