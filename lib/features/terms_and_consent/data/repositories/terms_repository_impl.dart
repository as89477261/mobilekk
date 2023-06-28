import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/common/data/datasources/internet_connection_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_logged_in_user_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/terms_local_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/terms_network_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/accept_terms/accept_terms_request.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/entities/terms/terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/repositories/terms_repository.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/accept_terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/get_updated_terms.dart';

class TermsRepositoryImpl implements TermsRepository {
  final InternetConnectionDatasource internetConnectionDatasource;
  final LocalLoggedInUserDatasource localLoggedInUserDatasource;
  final TermsLocalDatasource termsLocalDatasource;
  final TermsNetworkDatasource termsNetworkDatasource;

  TermsRepositoryImpl({
    required this.internetConnectionDatasource,
    required this.localLoggedInUserDatasource,
    required this.termsLocalDatasource,
    required this.termsNetworkDatasource,
  });

  @override
  Future<AppResponse<Terms>> getUpdatedTerms() async {
    final isConnectedToInternet =
        await internetConnectionDatasource.isConnected();
    if (!isConnectedToInternet) {
      return AppResponse(value: null, error: AppError.noInternet);
    }

    final response = await termsNetworkDatasource.getUpdatedTerms();
    final termString = response.termsString;

    if (termString != null) {
      return AppResponse(value: Terms(terms: termString), error: null);
    }
    return AppResponse(
        value: null, error: GetUpdateTermsError.getUpdateTermsFailed);
  }

  @override
  Future<AppResponse<bool>> acceptTerms(Terms terms) async {
    final user = await localLoggedInUserDatasource.getLoggedInUser();
    if(user == null){
      return AppResponse(value: false, error: AcceptTermsError.cannotAccept);
    }

    await termsLocalDatasource.acceptTerms(AcceptTermsRequest(userId: user.id));
    return AppResponse(value: true, error: null);
  }
}
