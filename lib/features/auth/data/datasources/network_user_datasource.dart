import 'package:oic_next_to_you/common/data/services/api_service.dart';

import '../models/store_user/store_user_request.dart';
import '../models/store_user/store_user_response.dart';

abstract class NetworkUserDatasource {
  Future<StoreUserResponse> storeUser(StoreUserRequest request);
}

class NetworkUserDatasourceImpl implements NetworkUserDatasource {
  final ApiService _apiService;

  NetworkUserDatasourceImpl(this._apiService);

  @override
  Future<StoreUserResponse> storeUser(StoreUserRequest request) async {
    try {
      final response = await _apiService.postHttp(
          endpoint: 'register/personal', parameters: request.toJson());
      return StoreUserResponse.fromJson(response.data);
    } catch(_){
      return StoreUserResponse();
    }
  }
}
