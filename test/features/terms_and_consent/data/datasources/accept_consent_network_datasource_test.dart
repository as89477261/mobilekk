import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/data/services/api_service.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/accept_consent_network_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/accept_consent/accept_consent_request.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/accept_consent/accept_consent_response.dart';

import '../../../../utils/random_value.dart';
import 'accept_consent_network_datasource_test.mocks.dart';

@GenerateMocks([ApiService, Response])
void main() {
  late MockApiService apiService;
  late AcceptConsentNetworkDatasourceImpl networkDatasource;

  setUp(() {
    apiService = MockApiService();
    networkDatasource = AcceptConsentNetworkDatasourceImpl(apiService);
  });

  group('acceptConsent', () {
    final mockResponse = MockResponse();
    when(mockResponse.data).thenReturn(null);
    setUp(() {
      when(apiService.postHttp(
          endpoint: anyNamed('endpoint'),
          parameters: anyNamed('parameters')))
          .thenAnswer((_) => Future.value(mockResponse));
    });
    test('should call apiService post to correct endpoint with correct params',
            () async {
          // arrange
          final request = AcceptConsentRequest(userId: getRandomString(10),
              oneMeansAccept: Random().nextBool() ? "1" : "0");

          // act
          await networkDatasource.acceptConsent(request);

          // assert
          verify(apiService.postHttp(endpoint: 'register/consent', parameters: request.toJson()));
    });
    test('should return correct response if parsable', () async {
      // arrange
      when(mockResponse.data).thenReturn(AcceptConsentResponse(
        resultStatus: getRandomString(2),
        resultObj: getRandomString(10),
        resultMessage: getRandomString(10),
        resultCode: getRandomString(2),
      ).toJson());

      final request = AcceptConsentRequest(userId: getRandomString(10),
          oneMeansAccept: "1");

      // act
      final response = await networkDatasource.acceptConsent(request);

      // assert
      expect(response, AcceptConsentResponse.fromJson(mockResponse.data));
    });

    test('should return empty response if not-parsable', () async {
      // arrange
      when(mockResponse.data).thenReturn(null);
      final request = AcceptConsentRequest(userId: getRandomString(10),
          oneMeansAccept: "1");

      // act
      final response = await networkDatasource.acceptConsent(request);

      // assert
      expect(response, AcceptConsentResponse());
    });

    test('should return empty response if apiService throws exception', () async {
      // arrange
      when(apiService.postHttp(
          endpoint: anyNamed('endpoint'),
          parameters: anyNamed('parameters'))).thenThrow(Exception(""));
      final request = AcceptConsentRequest(userId: getRandomString(10),
          oneMeansAccept: "1");

      // act
      final response = await networkDatasource.acceptConsent(request);

      // assert
      expect(response, AcceptConsentResponse());
    });
  });
}
