import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:oic_next_to_you/common/domain/entities/user/user.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_logged_in_user_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/network_user_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/models/logged_in_user/logged_in_user.dart';
import 'package:oic_next_to_you/features/auth/data/models/store_user/store_user_request.dart';
import 'package:oic_next_to_you/features/auth/data/models/store_user/store_user_response.dart';
import 'package:oic_next_to_you/features/auth/data/repositories/user_repository_impl.dart';

import '../../../../utils/random_value.dart';
import 'user_repository_impl_test.mocks.dart';

@GenerateMocks([LocalLoggedInUserDatasource, NetworkUserDatasource])
void main() {
  late MockLocalLoggedInUserDatasource datasource;
  late MockNetworkUserDatasource networkUserDatasource;
  late UserRepositoryImpl repository;

  setUp(() {
    datasource = MockLocalLoggedInUserDatasource();
    networkUserDatasource = MockNetworkUserDatasource();
    repository = UserRepositoryImpl(
      localLoggedInUserDatasource: datasource,
      networkUserDatasource: networkUserDatasource,
    );
  });

  group('getLoggedInUser', () {
    test('should call datasource getLoggedInUser', () async {
      // arrange
      when(datasource.getLoggedInUser()).thenAnswer((_) => Future.value(null));

      // act
      await repository.getLoggedInUser();

      // assert
      verify(datasource.getLoggedInUser());
    });

    test('should return null if datasource return null', () async {
      // arrange
      when(datasource.getLoggedInUser()).thenAnswer((_) => Future.value(null));

      // act
      final user = await repository.getLoggedInUser();

      // assert
      expect(user, null);
    });

    test(
        'should return mapped user with the same id, phoneNumber if datasource result not null',
        () async {
      // arrange
      final storedUser = LoggedInUser(
          id: getRandomString(20), phoneNumber: getRandomString(10));
      when(datasource.getLoggedInUser())
          .thenAnswer((_) => Future.value(storedUser));

      // act
      final user = await repository.getLoggedInUser();

      // assert
      expect(user?.phoneNumber, storedUser.phoneNumber);
      expect(user?.id, storedUser.id);
    });
  });

  group('setLoggedInUser', () {
    setUp(() {
      when(datasource.setLoggedInUser(any))
          .thenAnswer((_) => Future.value(true));
      when(networkUserDatasource.storeUser(any))
          .thenAnswer((_) => Future.value(StoreUserResponse()));
    });
    test('should call networkDatasource storeUser with correct value',
        () async {
      // arrange
      final user =
          User(id: getRandomString(10), phoneNumber: getRandomString(10));
      // act
      await repository.setLoggedInUser(user);

      // assert
      verify(networkUserDatasource.storeUser(StoreUserRequest(
        phoneNumber: user.phoneNumber,
        userId: user.id,
      )));
    });

    test('should call datasource setLoggedInUser with the correct value',
        () async {
      // arrange

      final user =
          User(id: getRandomString(10), phoneNumber: getRandomString(10));
      // act
      await repository.setLoggedInUser(user);

      // assert
      verify(datasource.setLoggedInUser(
          LoggedInUser(id: user.id, phoneNumber: user.phoneNumber)));
    });
  });

  group('logout', () {
    test('logout should call datasource setLoggedInUser null', () async {
      when(datasource.setLoggedInUser(any))
          .thenAnswer((_) => Future.value(true));

      // act
      await repository.logout();

      // assert
      verify(datasource.setLoggedInUser(null));
    });
  });
}
