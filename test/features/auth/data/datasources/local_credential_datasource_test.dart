import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_credential_datasource.dart';

import '../../../../utils/random_value.dart';
import 'local_credential_datasource_test.mocks.dart';

@GenerateMocks([PhoneAuthCredential])
void main() {
  late InMemoryLocalCredentialDatasource datasource;

  setUp(() {
    datasource = InMemoryLocalCredentialDatasource();
  });

  test('getCredentialFromPhoneNumber from empty should return null', () async {
    // arrange

    // act
    final value = datasource.getVerificationIdOfPhoneNumber(getRandomString(10));

    // assert
    expect(value, null);
  });

  test(
      'setVerificationIdOfPhoneNumber and then setVerificationIdOfPhoneNumber from same number should return correct value', () async {
    // arrange
    final phoneNumber = getRandomString(10);
    final verificationCode = getRandomString(20);
    datasource.setVerificationIdOfPhoneNumber(
        phoneNumber: phoneNumber, verificationId: verificationCode);

    // act
    final value = datasource.getVerificationIdOfPhoneNumber(phoneNumber);

    // assert
    expect(value, verificationCode);
  });

  test(
      'setVerificationIdOfPhoneNumber more than once should return correct value', () async {
    // arrange
    final phoneNumber = getRandomString(10);
    final verificationCode = getRandomString(20);
    datasource.setVerificationIdOfPhoneNumber(
        phoneNumber: phoneNumber, verificationId: verificationCode);
    final verificationCode2 = getRandomString(20);
    datasource.setVerificationIdOfPhoneNumber(
        phoneNumber: phoneNumber, verificationId: verificationCode2);

    // act
    final value = datasource.getVerificationIdOfPhoneNumber(phoneNumber);

    // assert
    expect(value, verificationCode2);
  });

  test(
      'setVerificationIdOfPhoneNumber more than one numbers should return correct value', () async {
    // arrange
    final phoneNumber = getRandomString(10);
    final verificationCode = getRandomString(20);
    datasource.setVerificationIdOfPhoneNumber(
        phoneNumber: phoneNumber, verificationId: verificationCode);
    final phoneNumber2 = getRandomString(10);
    final verificationCode2 = getRandomString(20);
    datasource.setVerificationIdOfPhoneNumber(
        phoneNumber: phoneNumber2, verificationId: verificationCode2);

    // act
    final value = datasource.getVerificationIdOfPhoneNumber(phoneNumber);
    final value2 = datasource.getVerificationIdOfPhoneNumber(phoneNumber2);

    // assert
    expect(value, verificationCode);
    expect(value2, verificationCode2);
  });
}
