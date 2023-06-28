import 'package:firebase_auth/firebase_auth.dart';

abstract class LocalVerificationIdDatasource {
  String? getVerificationIdOfPhoneNumber(String phoneNumber);

  setVerificationIdOfPhoneNumber({
    required String phoneNumber,
    required String verificationId,
  });
}

class InMemoryLocalCredentialDatasource implements LocalVerificationIdDatasource {
  final Map<String, String> cache = {};
  @override
  String? getVerificationIdOfPhoneNumber(String phoneNumber) {
    return cache[phoneNumber]?.toString();
  }

  @override
  setVerificationIdOfPhoneNumber({required String phoneNumber, required String verificationId}) {
    cache[phoneNumber] = verificationId;
  }
}