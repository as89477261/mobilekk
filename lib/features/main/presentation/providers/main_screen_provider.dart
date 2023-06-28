import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oic_next_to_you/features/auth/domain/usecases/get_logged_in_user.dart';
import 'package:oic_next_to_you/features/main/domain/usecases/user_record_history.dart';

import 'package:oic_next_to_you/features/main/data/datasources/main_datasource.dart';
import 'package:oic_next_to_you/features/main/data/models/history/res_personal_history.dart';
import '../../domain/usecases/user_logout.dart';
part 'main_screen_provider.freezed.dart';

class MainScreenProvider with ChangeNotifier {
  MainScreenUIState _uiState;

  MainScreenUIState get state => _uiState;
  final UserLogout userLogout;
  final GetLoggedInUser getLoggedInUser;

  MainScreenProvider(
      {MainScreenUIState? uiState,
      required this.userLogout,
      required this.getLoggedInUser})
      : _uiState = uiState ?? MainScreenUIState();

  Future<void> logout() async {
    await userLogout();
    _uiState = _uiState.copyWith(loggedOut: true);
    notifyListeners();
  }

  Future<void> fetchUserAndHistories() async {
    // TODO("fetch histories and add test")
    _uiState = _uiState.copyWith(isLoading: true);
    notifyListeners();
    final user = await getLoggedInUser();
    _uiState =
        _uiState.copyWith(isLoading: false, userNumber: user?.phoneNumber);
    notifyListeners();
  }

  Future<List<res_personal_history>> fetchUserRecordHistories(
      String id, String phoneNumber) async {
    // TODO("fetch histories and add test")
    _uiState = _uiState.copyWith(isLoading: true);
    notifyListeners();
    var sourceObj = await RecordDatasourceImpl().getPersonalRecordHistory(id);
    sourceObj.sort((a, b) => a.creatEDATE!.compareTo(b.creatEDATE!));
    sourceObj = sourceObj.reversed.toList();

    _uiState = _uiState.copyWith(isLoading: false, userNumber: phoneNumber);
    notifyListeners();
    return sourceObj;
  }
}

@freezed
class MainScreenUIState with _$MainScreenUIState {
  factory MainScreenUIState(
      {@Default(null) String? userNumber,
      @Default(false) bool isLoading,
      @Default(false) bool loggedOut,
      @Default([]) List<HistoryUIState> histories}) = _MainScreenUIState;
}

@freezed
class HistoryUIState with _$HistoryUIState {
  factory HistoryUIState(
      {@Default('') String formattedDate,
      @Default('') String agentName,
      @Default('') String transcribedText}) = _HistoryUIState;
}
