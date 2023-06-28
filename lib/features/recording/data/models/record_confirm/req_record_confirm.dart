class reqRecordConfirm {
  String? agenTID;
  String? agenTSEARCHSTATUS;
  String? raWTEXTRECORD;
  String? detecteDTEXTRECORD;
  String? agenTNAME;
  String? latitude;
  String? longtitude;
  String? risKLEVEL;
  int? risKCOUNT;
  String? iSFRUAD;
  String? creatEBY;
  String? sessioNID;
  String? personaLCODE;

  reqRecordConfirm(
      {this.agenTID,
      this.agenTSEARCHSTATUS,
      this.raWTEXTRECORD,
      this.detecteDTEXTRECORD,
      this.agenTNAME,
      this.latitude,
      this.longtitude,
      this.risKLEVEL,
      this.risKCOUNT,
      this.iSFRUAD,
      this.creatEBY,
      this.sessioNID,
      this.personaLCODE});

  reqRecordConfirm.fromJson(Map<String, dynamic> json) {
    agenTID = json['agenT_ID'];
    agenTSEARCHSTATUS = json['agenT_SEARCH_STATUS'];
    raWTEXTRECORD = json['raW_TEXT_RECORD'];
    detecteDTEXTRECORD = json['detecteD_TEXT_RECORD'];
    agenTNAME = json['agenT_NAME'];
    latitude = json['latitude'];
    longtitude = json['longtitude'];
    risKLEVEL = json['risK_LEVEL'];
    risKCOUNT = json['risK_COUNT'];
    iSFRUAD = json['iS_FRUAD'];
    creatEBY = json['creatE_BY'];
    sessioNID = json['sessioN_ID'];
    personaLCODE = json['personaL_CODE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agenT_ID'] = this.agenTID;
    data['agenT_SEARCH_STATUS'] = this.agenTSEARCHSTATUS;
    data['raW_TEXT_RECORD'] = this.raWTEXTRECORD;
    data['detecteD_TEXT_RECORD'] = this.detecteDTEXTRECORD;
    data['agenT_NAME'] = this.agenTNAME;
    data['latitude'] = this.latitude;
    data['longtitude'] = this.longtitude;
    data['risK_LEVEL'] = this.risKLEVEL;
    data['risK_COUNT'] = this.risKCOUNT;
    data['iS_FRUAD'] = this.iSFRUAD;
    data['creatE_BY'] = this.creatEBY;
    data['sessioN_ID'] = this.sessioNID;
    data['personaL_CODE'] = this.personaLCODE;
    return data;
  }
}
