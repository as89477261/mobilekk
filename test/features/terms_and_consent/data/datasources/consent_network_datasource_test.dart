import 'dart:convert';
import 'dart:math';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/consent_network_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/updated_consent/updated_consent.dart';

import '../../../../utils/random_value.dart';
import 'consent_network_datasource_test.mocks.dart';

@GenerateMocks([FirebaseRemoteConfig])
void main() {
  late MockFirebaseRemoteConfig remoteConfig;
  late ConsentNetworkDatasourceImpl networkDatasource;

  setUp(() {
    remoteConfig = MockFirebaseRemoteConfig();
    when(remoteConfig.fetchAndActivate()).thenAnswer((_) => Future.value(true));

    networkDatasource = ConsentNetworkDatasourceImpl(remoteConfig: remoteConfig);
  });

  test('getUpdatedConsent should call remoteConfig fetchAndActivate and'
      ' getString with correct key', () async {
    // arrange
    when(remoteConfig.getString(any)).thenReturn('');

    // act
    await networkDatasource.getUpdatedConsent();

    // assert
    verifyInOrder([
      remoteConfig.fetchAndActivate(),
      remoteConfig.getString('consent')
    ]);
  });

  test('getUpdatedConsent should return empty response if remoteConfig throw exception', () async {
    // arrange
    when(remoteConfig.getString(any)).thenThrow(Exception());

    // act
    final response = await networkDatasource.getUpdatedConsent();

    // assert
    expect(response, UpdatedConsent(consentString: null));
  });

  test('getUpdatedConsent should return empty response if remoteConfig result is not json', () async {
    // arrange
    when(remoteConfig.getString(any)).thenAnswer((_) => getRandomString(100));

    // act
    final response = await networkDatasource.getUpdatedConsent();

    // assert
    expect(response, UpdatedConsent(consentString: null));
  });

  test('getUpdatedConsent should return UpdatedConsent.fromJson of result', () async {
    // arrange
    final updatedConsent = UpdatedConsent(consentString: getRandomString(100));
    when(remoteConfig.getString(any)).thenAnswer((_) => json.encode(updatedConsent.toJson()));

    // act
    final response = await networkDatasource.getUpdatedConsent();

    // assert
    expect(response, updatedConsent);
  });
}
