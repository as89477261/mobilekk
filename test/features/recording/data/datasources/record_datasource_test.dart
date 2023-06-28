import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/data/services/api_service.dart';
import 'package:oic_next_to_you/features/recording/data/datasources/record_datasource.dart';
import 'package:oic_next_to_you/features/recording/data/models/start_record/request/start_record_request.dart';
import 'package:oic_next_to_you/features/recording/data/models/start_record/response/start_record_response.dart';

import '../../../../utils/random_value.dart';
import '../../../terms_and_consent/data/datasources/accept_consent_network_datasource_test.mocks.dart';

@GenerateMocks([ApiService, Response])
void main() {
  late MockApiService apiService;
  late RecordDatasourceImpl datasource;

  setUp(() {
    apiService = MockApiService();
    datasource = RecordDatasourceImpl();
  });

  group('startRecord', () {
    test('should call apiService post with correct endpoint and parameters',
        () async {
      // arrange
      when(apiService.postHttp(
              endpoint: anyNamed('endpoint'),
              parameters: anyNamed('parameters')))
          .thenAnswer((_) => Future.value(MockResponse()));

      // act
      final request = StartRecordRequest(
        createdBy: getRandomString(10),
        sessionId: getRandomString(10),
        userId: getRandomString(10),
      );
      await datasource.setStartRecord(request);

      // assert
      verify(apiService.postHttp(
          endpoint: 'record/start', parameters: request.toJson()));
    });

    test(
        'should return empty response if apiService return not parsable response',
        () async {
      // arrange
      when(apiService.postHttp(
        endpoint: anyNamed('endpoint'),
        parameters: anyNamed('parameters'),
      )).thenAnswer((_) async => MockResponse());

      final request = StartRecordRequest(
        createdBy: getRandomString(10),
        sessionId: getRandomString(10),
        userId: getRandomString(10),
      );
      // act
      final response = await datasource.setStartRecord(request);

      // assert
      expect(response, StartRecordResponse());
    });

    test('should return empty response if apiService throws exception',
        () async {
      // arrange
      when(apiService.postHttp(
        endpoint: anyNamed('endpoint'),
        parameters: anyNamed('parameters'),
      )).thenThrow(Exception());

      final request = StartRecordRequest(
        createdBy: getRandomString(10),
        sessionId: getRandomString(10),
        userId: getRandomString(10),
      );

      // act
      final response = await datasource.setStartRecord(request);

      // assert
      expect(response, StartRecordResponse());
    });

    test('should return parsed response from apiService', () async {
      // arrange
      final mockResponse = MockResponse();
      when(mockResponse.data).thenReturn(StartRecordResponse(
        resultCode: getRandomString(2),
        resultMessage: getRandomString(10),
        resultObj: getRandomString(3),
        resultStatus: getRandomString(2),
      ).toJson());
      when(apiService.postHttp(
        endpoint: anyNamed('endpoint'),
        parameters: anyNamed('parameters'),
      )).thenAnswer((_) async => mockResponse);

      final request = StartRecordRequest(
        createdBy: getRandomString(10),
        sessionId: getRandomString(10),
        userId: getRandomString(10),
      );
      // act
      final response = await datasource.setStartRecord(request);

      // assert
      expect(response, StartRecordResponse.fromJson(mockResponse.data));
    });
  });
}
