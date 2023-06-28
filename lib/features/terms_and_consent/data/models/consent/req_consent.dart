class reqConsent {
  String? personaLCODE;
  String? iSCONSENT1;
  String? iSCONSENT2;

  reqConsent({this.personaLCODE, this.iSCONSENT1, this.iSCONSENT2});

  reqConsent.fromJson(Map<String, dynamic> json) {
    personaLCODE = json['personaL_CODE'];
    iSCONSENT1 = json['iS_CONSENT_1'];
    iSCONSENT2 = json['iS_CONSENT_2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['personaL_CODE'] = this.personaLCODE;
    data['iS_CONSENT_1'] = this.iSCONSENT1;
    data['iS_CONSENT_2'] = this.iSCONSENT2;
    return data;
  }
}
