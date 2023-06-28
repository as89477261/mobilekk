import 'package:oic_next_to_you/common/domain/entities/user/user.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_logged_in_user_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/network_user_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/models/logged_in_user/logged_in_user.dart';
import 'package:oic_next_to_you/features/auth/data/models/store_user/store_user_request.dart';
import 'package:oic_next_to_you/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final LocalLoggedInUserDatasource localLoggedInUserDatasource;
  final NetworkUserDatasource networkUserDatasource;

  UserRepositoryImpl({
    required this.localLoggedInUserDatasource,
    required this.networkUserDatasource,
  });

  @override
  Future<User?> getLoggedInUser() async {
    final user = await localLoggedInUserDatasource.getLoggedInUser();
    if (user == null) {
      return null;
    }
    return User(id: user.id, phoneNumber: user.phoneNumber);
  }

  @override
  Future<bool> setLoggedInUser(User user) async {
    await networkUserDatasource.storeUser(StoreUserRequest(
      phoneNumber: user.phoneNumber,
      userId: user.id,
    ));
    return await localLoggedInUserDatasource.setLoggedInUser(
        LoggedInUser(id: user.id, phoneNumber: user.phoneNumber));
  }

  @override
  Future<bool> logout() async {
    return localLoggedInUserDatasource.setLoggedInUser(null);
  }
}
