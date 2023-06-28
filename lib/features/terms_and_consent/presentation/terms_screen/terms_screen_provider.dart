import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/entities/terms/terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/accept_terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/domain/usecases/get_updated_terms.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/datasources/terms_datasource.dart';
import 'package:oic_next_to_you/features/terms_and_consent/data/models/terms/req_term.dart';
import 'package:oic_next_to_you/common/core/session.dart';
import 'package:oic_next_to_you/common/utility/extension.dart';
part 'terms_screen_provider.freezed.dart';

class TermsScreenProvider with ChangeNotifier {
  final GetUpdatedTerms _getUpdatedTerms;
  final AcceptTerms _acceptTerms;

  TermsScreenUIState _state;

  TermsScreenUIState get state => _state;

  TermsScreenDataStore _dataStore;

  TermsScreenDataStore get dataStore => _dataStore;

  TermsScreenProvider(this._state, this._getUpdatedTerms, this._acceptTerms,
      {TermsScreenDataStore? dataStore})
      : _dataStore = dataStore ?? TermsScreenDataStore();

  Future<void> getTerms() async {
    var currentUser = await Session().GetSessionPersonal();

    if (_state.getTermsState == GetTermsState.loading) {
      return;
    }
    _state = _state.copyWith(getTermsState: GetTermsState.loading);
    notifyListeners();

    final response = await _getUpdatedTerms();
    final terms = response.value;

    _dataStore = dataStore.copyWith(terms: terms);
    _state = _state.copyWith(
      termString: terms?.terms,
      getTermsError: response.error?.errorMessage,
      getTermsState: GetTermsState.done,
    );
    notifyListeners();
  }

  Future<void> acceptTerms() async {
    var currentUser = await Session().GetSessionPersonal();
    final storedTerms = dataStore.terms;
    if (_state.nextButtonState == NextButtonState.loading ||
        storedTerms == null) {
      return;
    }
    _state = _state.copyWith(nextButtonState: NextButtonState.loading);
    notifyListeners();

    TermDatasource()
        .setTerm(reqTerm(iSCONDITION1: "1", personaLCODE: currentUser.uid));

    final response = await _acceptTerms(storedTerms);
    _state = _state.copyWith(
      nextButtonState: NextButtonState.enabled,
      isTermsAcceptSuccess: response.value ?? false,
      acceptTermsError: response.error?.errorMessage,
    );
    notifyListeners();
  }
}

@freezed
class TermsScreenDataStore with _$TermsScreenDataStore {
  factory TermsScreenDataStore({@Default(null) Terms? terms}) =
      _TermsScreenDataStore;
}

@freezed
class TermsScreenUIState with _$TermsScreenUIState {
  factory TermsScreenUIState({
    @Default(GetTermsState.started) GetTermsState getTermsState,
    @Default(null) String? getTermsError,
    @Default(null) String? termString,
    @Default(NextButtonState.enabled) NextButtonState nextButtonState,
    @Default(false) bool isTermsAcceptSuccess,
    @Default(null) String? acceptTermsError,
  }) = _TermsScreenUIState;
}

enum GetTermsState { started, loading, done }

enum NextButtonState { loading, enabled }

enum ScrollState { beforeEnd, end }
