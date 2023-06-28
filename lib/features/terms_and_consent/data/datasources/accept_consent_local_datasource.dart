import 'package:shared_preferences/shared_preferences.dart';

import '../models/is_consent_allowed/is_consent_allowed.dart';
import 'consent_network_datasource.dart';

abstract class AcceptConsentLocalDatasource {
  Future<IsConsentAllowed> getAllowedConsent({required String userId});
  Future<bool> acceptConsent({required String userId, required bool isAllowed});
}

class ConsentLocalDatasourceImpl implements AcceptConsentLocalDatasource {

  final SharedPreferences sharedPreferences;
  ConsentLocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<IsConsentAllowed> getAllowedConsent({required String userId}) async {
    try {
      final isAllowed = sharedPreferences.getBool('${userId}_consent_allowed');
      return IsConsentAllowed(isConsentAllowed: isAllowed);
    } catch(_){
      return IsConsentAllowed(isConsentAllowed: null);
    }
  }

  @override
  Future<bool> acceptConsent({required String userId, required bool isAllowed}) async {
    await sharedPreferences.setBool('${userId}_consent_allowed', isAllowed);
    return true;
  }
}