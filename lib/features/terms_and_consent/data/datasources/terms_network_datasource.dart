import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../models/updated_terms/updated_terms.dart';

abstract class TermsNetworkDatasource {
  Future<UpdatedTerms> getUpdatedTerms();
}

class RemoteConfigTermsNetworkDatasource implements TermsNetworkDatasource {

  final FirebaseRemoteConfig firebaseRemoteConfig;
  RemoteConfigTermsNetworkDatasource({required this.firebaseRemoteConfig});

  @override
  Future<UpdatedTerms> getUpdatedTerms() async{
    try {
      await firebaseRemoteConfig.fetchAndActivate();
      final response = firebaseRemoteConfig.getString('terms_and_conditions');
      final jsonResponse = json.decode(response);
      final updatedTerms = UpdatedTerms.fromJson(jsonResponse);
      return updatedTerms;
    }
    catch(e){
      return UpdatedTerms();
    }

  }
}