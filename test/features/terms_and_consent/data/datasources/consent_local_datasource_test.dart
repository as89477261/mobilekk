import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/accept_consent_local_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/is_consent_allowed/is_consent_allowed.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/random_value.dart';
import 'consent_local_datasource_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences sharedPreferences;
  late ConsentLocalDatasourceImpl datasource;

  setUp(() {
    sharedPreferences = MockSharedPreferences();
    datasource = ConsentLocalDatasourceImpl(sharedPreferences: sharedPreferences);
  });

  group('getUpdatedConsent', () {
    test('should call sharedPreferences getBool with correct key', () async {
      // arrange
      when(sharedPreferences.getBool(any)).thenReturn(false);
      final userId = getRandomString(10);

      // act
      await datasource.getAllowedConsent(userId: userId);

      // assert
      verify(sharedPreferences.getBool('${userId}_consent_allowed'));
    });

    test('should return empty IsConsentAllowed if sharedPreferences throws exception', () async {
      // arrange
      when(sharedPreferences.getBool(any)).thenThrow(Exception());

      // act
      final response = await datasource.getAllowedConsent(userId: getRandomString(10));

      // assert
      expect(response, IsConsentAllowed(isConsentAllowed: null));
    });

    test('should return empty IsConsentAllowed if sharedPreferences value null', () async {
      // arrange
      when(sharedPreferences.getBool(any)).thenReturn(null);

      // act
      final response = await datasource.getAllowedConsent(userId: getRandomString(10));

      // assert
      expect(response, IsConsentAllowed(isConsentAllowed: null));
    });

    test('should return IsConsentAllowed value according to sharedPreferences', () async {
      // arrange
      final isAllowed = Random().nextBool();
      when(sharedPreferences.getBool(any)).thenReturn(isAllowed);

      // act
      final response = await datasource.getAllowedConsent(userId: getRandomString(10));

      // assert
      expect(response, IsConsentAllowed(isConsentAllowed: isAllowed));
    });
  });

  group('acceptConsent', () {
    test('should call sharedPreferences setBool with correct params', () async {
      // arrange
      when(sharedPreferences.setBool(any, any)).thenAnswer((_) => Future.value(true));
      final userId = getRandomString(10);
      final isAllowed = Random().nextBool();
      // act
      await datasource.acceptConsent(userId: userId, isAllowed: isAllowed);

      // assert
      verify(
        sharedPreferences.setBool('${userId}_consent_allowed', isAllowed)
      );
    });
  });
}
