import 'package:oic_next_to_you/features/detail/data/detail_datasource.dart';
import 'package:oic_next_to_you/features/detail/models/res_detail_model.dart';

class DetailProvider {
  Future<List<resDetail>> getPersonalDetailRecordHistory(
      String sessionID) async {
    var response =
        await RecordDatasourceImpl().getPersonalDetailRecordHistory(sessionID);
    return response;
  }
}
