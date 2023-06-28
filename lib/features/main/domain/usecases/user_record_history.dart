import 'package:oic_next_to_you/features/main/data/datasources/main_datasource.dart';
import 'package:oic_next_to_you/features/main/data/models/history/res_personal_history.dart';

class UserRecordHistory {
  Future<List<res_personal_history>> call(String id) async {
    var sourceObj = new RecordDatasourceImpl();
    var lstUserHistory = await sourceObj.getPersonalRecordHistory((id));

    return lstUserHistory;
  }
}
