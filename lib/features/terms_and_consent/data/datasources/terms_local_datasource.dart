import 'package:oic_next_to_you/common/data/datasources/current_time_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/accept_terms/accept_terms_request.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/accept_terms/accept_terms_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TermsLocalDatasource {
  Future<AcceptTermsResponse> acceptTerms(AcceptTermsRequest request);
}

class TermsLocalDatasourceImpl implements TermsLocalDatasource {
  final CurrentTimeDatasource currentTimeDatasource;
  final SharedPreferences sharedPreference;

  TermsLocalDatasourceImpl({
    required this.currentTimeDatasource,
    required this.sharedPreference,
  });

  @override
  Future<AcceptTermsResponse> acceptTerms(AcceptTermsRequest request) async {
    final time = await currentTimeDatasource.get();
    sharedPreference.setInt(
        '${request.userId}_terms_read', time.millisecondsSinceEpoch);
    return AcceptTermsResponse(isSuccess: true);
  }
}
