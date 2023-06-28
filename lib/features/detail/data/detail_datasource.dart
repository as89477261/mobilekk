import 'dart:core';
import 'package:oic_next_to_you/common/data/services/api_service.dart';
import 'package:oic_next_to_you/features/detail/models/res_detail_model.dart';
import 'package:oic_next_to_you/common/data/models/genericResponse.dart';

class RecordDatasourceImpl {
  late ApiService _apiService;

  RecordDatasourceImpl() {
    _apiService = new ApiService();
  }

  Future<List<resDetail>> getPersonalDetailRecordHistory(
      String sessionID) async {
    try {
      List<resDetail> result = [];

      await _apiService
          .getHttp(endpoint: 'record/history/detail/' + sessionID)
          .then((responseData) {
        var buffer = GenericResponse.fromJson(responseData.data);
        if (buffer.resulTSTATUS == "OK" &&
            buffer.resulTOBJ.toString() != "" &&
            buffer.resulTOBJ.toString() != "[]") {
          result = resDetail.fromJsonToList(buffer.resulTOBJ!);
          return result;
        } else {
          return [];
        }
      });

      return result;
    } catch (_) {
      throw _;
    }
  }
}
