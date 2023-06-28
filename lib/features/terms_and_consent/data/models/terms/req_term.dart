class reqTerm {
  String? personaLCODE;
  String? iSCONDITION1;

  reqTerm({this.personaLCODE, this.iSCONDITION1});

  reqTerm.fromJson(Map<String, dynamic> json) {
    personaLCODE = json['personaL_CODE'];
    iSCONDITION1 = json['iS_CONDITION_1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['personaL_CODE'] = this.personaLCODE;
    data['iS_CONDITION_1'] = this.iSCONDITION1;
    return data;
  }
}
