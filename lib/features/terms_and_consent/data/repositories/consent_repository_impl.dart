import 'package:oic_next_to_you/common/core/app_error.dart';
import 'package:oic_next_to_you/common/core/app_response.dart';
import 'package:oic_next_to_you/common/data/datasources/internet_connection_datasource.dart';
import 'package:oic_next_to_you/features/auth/data/datasources/local_logged_in_user_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/accept_consent_local_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/accept_consent_network_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/consent_network_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/accept_consent/accept_consent_request.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/entities/consent/consent.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/repositories/consent_repository.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/get_updated_consent.dart';

class ConsentRepositoryImpl implements ConsentRepository {
  final InternetConnectionDatasource internetConnectionDatasource;
  final LocalLoggedInUserDatasource localLoggedInUserDatasource;
  final AcceptConsentLocalDatasource consentLocalDatasource;
  final AcceptConsentNetworkDatasource acceptConsentNetworkDatasource;
  final ConsentNetworkDatasource consentNetworkDatasource;

  ConsentRepositoryImpl({
    required this.internetConnectionDatasource,
    required this.localLoggedInUserDatasource,
    required this.consentLocalDatasource,
    required this.acceptConsentNetworkDatasource,
    required this.consentNetworkDatasource,
  });

  @override
  Future<AppResponse<Consent>> getUpdatedConsent() async {
    final isInternetConnected =
        await internetConnectionDatasource.isConnected();
    if (!isInternetConnected) {
      return AppResponse(value: null, error: AppError.noInternet);
    }

    try {
      final consent = await consentNetworkDatasource.getUpdatedConsent();
      final consentString = consent.consentString;
      if (consentString == null) {
        return AppResponse(
          value: null,
          error: GetUpdatedConsentError.getUpdateConsentFailed,
        );
      }

      final user = await localLoggedInUserDatasource.getLoggedInUser();
      if (user == null) {
        return AppResponse(
          value: Consent(consent: consentString, isAllowed: false),
          error: null,
        );
      }

      final isAllowed =
          await consentLocalDatasource.getAllowedConsent(userId: user.id);
      return AppResponse(
        value: Consent(
          consent: consentString,
          isAllowed: isAllowed.isConsentAllowed ?? false,
        ),
        error: null,
      );
    } catch (_) {
      // do nothing
    }
    return AppResponse(
      value: null,
      error: GetUpdatedConsentError.getUpdateConsentFailed,
    );
  }

  @override
  Future<AppResponse<bool>> acceptConsent(Consent consent) async {
    final user = await localLoggedInUserDatasource.getLoggedInUser();

    if (user == null) {
      return AppResponse(value: false, error: null);
    }

    await consentLocalDatasource.acceptConsent(
      userId: user.id,
      isAllowed: consent.isAllowed,
    );

    await acceptConsentNetworkDatasource.acceptConsent(AcceptConsentRequest(
        userId: user.id, oneMeansAccept: consent.isAllowed ? "1" : "0"));

    return AppResponse(value: true, error: null);
  }
}
