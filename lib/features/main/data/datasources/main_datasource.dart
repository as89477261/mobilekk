import 'dart:convert';
import 'dart:core';
import 'package:oic_next_to_you/common/data/services/api_service.dart';
import '../models/history/res_personal_history.dart';
import 'package:oic_next_to_you/common/data/models/genericResponse.dart';

class RecordDatasourceImpl {
  late ApiService _apiService;

  RecordDatasourceImpl() {
    _apiService = new ApiService();
  }

  Future<List<res_personal_history>> getPersonalRecordHistory(
      String personalID) async {
    try {
      List<res_personal_history> result = [];

      await _apiService
          .getHttp(endpoint: 'record/history/' + personalID)
          .then((responseData) {
        var buffer = GenericResponse.fromJson(responseData.data);
        if (buffer.resulTSTATUS == "OK" &&
            buffer.resulTOBJ.toString() != "" &&
            buffer.resulTOBJ.toString() != "[]") {
          result = res_personal_history.fromJsonToList(buffer.resulTOBJ!);
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
