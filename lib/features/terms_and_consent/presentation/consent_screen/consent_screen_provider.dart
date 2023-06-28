import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/entities/consent/consent.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/accept_consent.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/get_updated_consent.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/consent_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/consent/req_consent.dart';
import 'package:oic_next_to_you/common/core/session.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';
part 'consent_screen_provider.freezed.dart';

class ConsentScreenProvider with ChangeNotifier {
  final GetUpdatedConsent getUpdatedConsentUsecase;
  final AcceptConsent acceptConsentUsecase;

  ConsentScreenUiState _state;

  ConsentScreenUiState get state => _state;

  ConsentScreenDatastore _datastore;

  ConsentScreenDatastore get datastore => _datastore;

  ConsentScreenProvider({
    required this.getUpdatedConsentUsecase,
    required this.acceptConsentUsecase,
    ConsentScreenUiState? state,
    ConsentScreenDatastore? datastore,
  })  : _datastore = datastore ?? ConsentScreenDatastore(),
        _state = state ?? ConsentScreenUiState();

  Future getConsent() async {
    var currentUser = await Session().GetSessionPersonal();
    if (_state.getConsentState == GetConsentState.loading) {
      return;
    }

    _state = _state.copyWith(getConsentState: GetConsentState.loading);
    notifyListeners();

    try {
      final response = await getUpdatedConsentUsecase();
      _state = _state.copyWith(
        getConsentState: GetConsentState.done,
        consentString: response.value?.consent,
        isConsentAllowed: response.value?.isAllowed,
        getConsentError: response.error?.errorMessage,
      );
      _datastore = _datastore.copyWith(consent: response.value);
      notifyListeners();
    } catch (_) {
      _state = _state.copyWith(
        getConsentState: GetConsentState.done,
        getConsentError:
            GetUpdatedConsentError.getUpdateConsentFailed.errorMessage,
      );
      notifyListeners();
    }
  }

  Future acceptConsent() async {
    var currentUser = await Session().GetSessionPersonal();
    if (_state.acceptConsentState == AcceptConsentState.loading) {
      return;
    }

    if (_datastore.consent == null) {
      _state = _state.copyWith(
        acceptConsentState: AcceptConsentState.done,
        acceptConsentError: AcceptConsentError.cannotAccept.errorMessage,
      );
      notifyListeners();
      return;
    }

    _state = _state.copyWith(acceptConsentState: AcceptConsentState.loading);
    notifyListeners();

    ConsentDatasource().setConsent(reqConsent(
        iSCONSENT1: "1", iSCONSENT2: "1", personaLCODE: currentUser.uid));

    final response = await acceptConsentUsecase(datastore.consent!);
    _state = _state.copyWith(
      acceptConsentState: AcceptConsentState.done,
      isConsentAcceptSuccess: response.value,
      acceptConsentError: response.error?.errorMessage,
    );
    notifyListeners();
  }

  Future updateIsAllowed(bool isAllowed) async {
    final consent = _datastore.consent;
    if (consent == null) {
      return;
    }

    _datastore = _datastore.copyWith(
        consent: Consent(consent: consent.consent, isAllowed: isAllowed));
    _state = _state.copyWith(isConsentAllowed: isAllowed);
    notifyListeners();
  }
}

@freezed
class ConsentScreenUiState with _$ConsentScreenUiState {
  factory ConsentScreenUiState({
    @Default(GetConsentState.started) GetConsentState getConsentState,
    @Default(AcceptConsentState.started) AcceptConsentState acceptConsentState,
    @Default(null) String? getConsentError,
    @Default(null) String? consentString,
    @Default(null) bool? isConsentAllowed,
    @Default(null) bool? isConsentAcceptSuccess,
    @Default(null) String? acceptConsentError,
  }) = _ConsentScreenUiState;
}

@freezed
class ConsentScreenDatastore with _$ConsentScreenDatastore {
  factory ConsentScreenDatastore({@Default(null) Consent? consent}) =
      _ConsentScreenDatastore;
}

enum GetConsentState { started, loading, done }

enum AcceptConsentState { started, loading, done }
