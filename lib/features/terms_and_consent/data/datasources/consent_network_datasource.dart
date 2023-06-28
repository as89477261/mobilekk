import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../models/updated_consent/updated_consent.dart';

abstract class ConsentNetworkDatasource {
  Future<UpdatedConsent> getUpdatedConsent();
}

class ConsentNetworkDatasourceImpl implements ConsentNetworkDatasource {

  final FirebaseRemoteConfig remoteConfig;
  ConsentNetworkDatasourceImpl({required this.remoteConfig});

  @override
  Future<UpdatedConsent> getUpdatedConsent() async {
    try {
      await remoteConfig.fetchAndActivate();
      final consentJsonStr = remoteConfig.getString('consent');
      final encodedJson = json.decode(consentJsonStr);
      final updatedConsent = UpdatedConsent.fromJson(encodedJson);
      return updatedConsent;
    } catch(_){
      // do nothing
    }

    return UpdatedConsent(consentString: null);
  }
}