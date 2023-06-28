import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/data/services/api_service.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/network_user_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/models/store_user/store_user_request.dart';
import 'package:oic_next_to_you/features/auth/data/models/store_user/store_user_response.dart';

import '../../../../utils/random_value.dart';
import 'network_user_datasource_test.mocks.dart';

@GenerateMocks([ApiService, Response<StoreUserResponse>])
void main() {
  late MockApiService apiService;
  late NetworkUserDatasourceImpl datasource;

  setUp(() {
    apiService = MockApiService();
    datasource = NetworkUserDatasourceImpl(apiService);
  });

  group('storeUser', () {
    final mockResponse = MockResponse();
    setUp(() {
      when(mockResponse.data).thenReturn(StoreUserResponse(
        resultCode: getRandomString(2),
        resultMessage: getRandomString(10),
        resultObj: getRandomString(3),
        resultStatus: getRandomString(2),
      ).toJson());
    });
    test('should call apiService post with correct parameters', () async {
      // arrange
      when(apiService.postHttp(
          endpoint: anyNamed('endpoint'),
          parameters: anyNamed('parameters')))
          .thenAnswer((_) =>
          Future.value(mockResponse));

      final request = StoreUserRequest(
        phoneNumber: getRandomString(10), userId: getRandomString(20),);
      // act
      await datasource.storeUser(request);

      // assert
      verify(
        apiService.postHttp(
          endpoint: 'register/personal',
          parameters: request.toJson()
        )
      );
    });

    test('should return parsed response correctly if not null', () async {
      // arrange
      when(apiService.postHttp(
          endpoint: anyNamed('endpoint'),
          parameters: anyNamed('parameters')))
          .thenAnswer((_) =>
          Future.value(mockResponse));

      final request = StoreUserRequest(
        phoneNumber: getRandomString(10), userId: getRandomString(20),);
      // act
      final response = await datasource.storeUser(request);

      // assert
      expect(response, StoreUserResponse.fromJson(mockResponse.data));
    });

    test('should return empty response if data null', () async {
      // arrange
      when(mockResponse.data).thenReturn(null);
      when(apiService.postHttp(
          endpoint: anyNamed('endpoint'),
          parameters: anyNamed('parameters')))
          .thenAnswer((_) =>
          Future.value(mockResponse));

      final request = StoreUserRequest(
        phoneNumber: getRandomString(10), userId: getRandomString(20),);
      // act
      final response = await datasource.storeUser(request);

      // assert
      expect(response, StoreUserResponse());
    });

    test('should return empty response if apiService throws exception', () async {
      // arrange
      when(mockResponse.data).thenReturn(null);
      when(apiService.postHttp(
          endpoint: anyNamed('endpoint'),
          parameters: anyNamed('parameters')))
          .thenThrow(Exception());

      final request = StoreUserRequest(
        phoneNumber: getRandomString(10), userId: getRandomString(20),);
      // act
      final response = await datasource.storeUser(request);

      // assert
      expect(response, StoreUserResponse());
    });
  });
}
