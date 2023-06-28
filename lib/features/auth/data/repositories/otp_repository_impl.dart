import 'package:firebase_auth_platform_interface/src/firebase_auth_exception.dart';
import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/common/data/datasources/internet_connection_datasource.dart';
import 'package:oic_next_to_you/common/domain/entities/user/user.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_credential_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/network_otp_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/models/request_otp/request_otp_request.dart';
import 'package:oic_next_to_you/features/auth/data/models/verify_otp/verify_otp_request.dart';

import 'package:oic_next_to_you/features/auth/domain/repositories/otp_repository.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/request_otp_with_phone_number.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/verify_otp_of_phone_number.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';
import '../../domain/repositories/user_repository.dart';

import 'package:oic_next_to_you/common/core/session.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';

class OtpRepositoryImpl implements OtpRepository {
  final InternetConnectionDatasource internetConnectionDatasource;
  final LocalVerificationIdDatasource localVerificationIdDatasource;
  final NetworkOtpDatasource networkOtpDatasource;

  final UserRepository userRepository;

  OtpRepositoryImpl({
    required this.internetConnectionDatasource,
    required this.localVerificationIdDatasource,
    required this.networkOtpDatasource,
    required this.userRepository,
  });

  @override
  Future<AppResponse<bool>> requestOtpWithPhoneNumber(
      {required String phoneNumber}) async {
    final isConnected = await internetConnectionDatasource.isConnected();

    if (!isConnected) {
      return AppResponse(value: null, error: AppError.noInternet);
    }

    final formattedPhoneNumber = phoneNumber.replaceFirst('0', '+66');
    final response = await networkOtpDatasource
        .requestOtp(RequestOtpRequest(phoneNumber: formattedPhoneNumber));

    final verificationId = response.verificationId;
    if (verificationId != null) {
      localVerificationIdDatasource.setVerificationIdOfPhoneNumber(
          phoneNumber: phoneNumber, verificationId: verificationId);
      return AppResponse(value: true, error: null);
    }

    if (response.exception != null) {
      return AppResponse(
          value: false, error: RequestOtpError.verifyNumberFailed);
    }

    if (response.isTimeout) {
      return AppResponse(value: false, error: RequestOtpError.timeout);
    }

    return AppResponse(value: false, error: AppError.unknown);
  }

  @override
  Future<AppResponse<User>> verifyOtpAndGetUser(
      {required String phoneNumber, required String otp}) async {
    final hasInternet = await internetConnectionDatasource.isConnected();
    if (!hasInternet) {
      return AppResponse(value: null, error: AppError.noInternet);
    }

    var verificationCode =
        "AL3R4eRmgRrKaf97UkBOQnqf9HeqeXeHfTCci4RSCM0YVBOpSXfx0Y9MbRu_3P9D8O_000HEgRxiGjJpC5UkxF8SZoOsWS_PZK0timKofF6PgDQtjhDbHznnU7NKRrQXVjfq89INHGUG56LCenyEIOHtYyKlBQeJqA";
    //final verificationCode = localVerificationIdDatasource        .getVerificationIdOfPhoneNumber(phoneNumber);
    if (verificationCode == null) {
      return AppResponse(
          value: null, error: VerifyOtpError.shouldReTryRequestOtp);
    }
    // final response = await networkOtpDatasource.verifyOtp(
    //     VerifyOtpRequest(verificationCode: verificationCode, otp: otp));

    // final exception = response.exception;
    // if (exception != null) {
    //   final error = _getErrorFromException(exception);
    //   return AppResponse(value: null, error: error);
    // }

    // final signedInCredentialUser = response.credential?.user;
    // if (signedInCredentialUser == null) {
    //   return AppResponse(
    //       value: null, error: VerifyOtpError.shouldRetrySubmitOtp);
    // }

    final user = User(
      id: Extension().getRandomString(30),
      //id: signedInCredentialUser.uid,
      phoneNumber: phoneNumber,
    );

    Session().SetUserID(user.id);
    Session().SetPhoneNumber(user.phoneNumber);
    await userRepository.setLoggedInUser(user);

    return AppResponse(value: user, error: null);
  }

  VerifyOtpError _getErrorFromException(FirebaseAuthException exception) {
    if (exception.code.contains('invalid-credential') ||
        exception.code.contains('invalid-verification-id')) {
      return VerifyOtpError.shouldReTryRequestOtp;
    }

    if (exception.code.contains('user-disabled') ||
        exception.code.contains('operation-not-allowed')) {
      return VerifyOtpError.shouldContactAdmin;
    }

    if (exception.code.contains('invalid-verification-code')) {
      return VerifyOtpError.incorrectOtp;
    }
    return VerifyOtpError.shouldContactAdmin;
  }
}
