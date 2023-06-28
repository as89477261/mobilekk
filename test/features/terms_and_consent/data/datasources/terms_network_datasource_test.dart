import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/terms_network_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/updated_terms/updated_terms.dart';

import '../../../../utils/random_value.dart';
import 'terms_network_datasource_test.mocks.dart';

@GenerateMocks([FirebaseRemoteConfig])
void main() {
  late MockFirebaseRemoteConfig remoteConfig;
  late RemoteConfigTermsNetworkDatasource datasource;

  setUp(() {
    remoteConfig = MockFirebaseRemoteConfig();
    when(remoteConfig.fetchAndActivate()).thenAnswer((_) => Future.value(true));
    when(remoteConfig.getString(any)).thenAnswer((_) => '');

    datasource =
        RemoteConfigTermsNetworkDatasource(firebaseRemoteConfig: remoteConfig);
  });

  group('getUpdatedTerms', () {
    test(
        'should call remoteConfig fetchAndActivate and getString terms_and_conditions',
        () async {
      // arrange

      // act
      await datasource.getUpdatedTerms();

      // assert
      verifyInOrder([
        remoteConfig.fetchAndActivate(),
        remoteConfig.getString('terms_and_conditions')
      ]);
    });

    test('should return empty UpdatedTerms if getString is not parsable',
        () async {
      // arrange
      when(remoteConfig.getString(any)).thenAnswer((_) => getRandomString(10));

      // act
      final response = await datasource.getUpdatedTerms();

      // assert
      expect(response, UpdatedTerms());
    });

    test('should return empty UpdatedTerms if getString throw exception',
        () async {
      // arrange
      when(remoteConfig.getString(any)).thenThrow(Exception());

      // act
      final response = await datasource.getUpdatedTerms();

      // assert
      expect(response, UpdatedTerms());
    });

    test('should return UpdatedTerms.toJson(result) if result is parsable',
        () async {
      // arrange
      final expected =
          UpdatedTerms(termsString: getRandomString(100));
      when(remoteConfig.getString(any)).thenAnswer((_) => json.encode(expected.toJson()));

      // act
      final response = await datasource.getUpdatedTerms();

      // assert
      expect(response, expected);
    });
  });
}
