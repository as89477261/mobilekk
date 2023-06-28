import 'dart:convert';

class res_personal_history {
  int? id;
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
  String? iSSENDOIC;
  String? status;
  String? creatEDATE;
  String? creatEBY;
  String? iSCONFIRMRECORD;
  String? sessioNID;
  String? personaLCODE;

  res_personal_history(
      {this.id,
      this.agenTID,
      this.agenTSEARCHSTATUS,
      this.raWTEXTRECORD,
      this.detecteDTEXTRECORD,
      this.agenTNAME,
      this.latitude,
      this.longtitude,
      this.risKLEVEL,
      this.risKCOUNT,
      this.iSFRUAD,
      this.iSSENDOIC,
      this.status,
      this.creatEDATE,
      this.creatEBY,
      this.iSCONFIRMRECORD,
      this.sessioNID,
      this.personaLCODE});

  res_personal_history.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    iSSENDOIC = json['iS_SEND_OIC'];
    status = json['status'];
    creatEDATE = json['creatE_DATE'];
    creatEBY = json['creatE_BY'];
    iSCONFIRMRECORD = json['iS_CONFIRM_RECORD'];
    sessioNID = json['sessioN_ID'];
    personaLCODE = json['personaL_CODE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    data['iS_SEND_OIC'] = this.iSSENDOIC;
    data['status'] = this.status;
    data['creatE_DATE'] = this.creatEDATE;
    data['creatE_BY'] = this.creatEBY;
    data['iS_CONFIRM_RECORD'] = this.iSCONFIRMRECORD;
    data['sessioN_ID'] = this.sessioNID;
    data['personaL_CODE'] = this.personaLCODE;
    return data;
  }

  static List<res_personal_history> fromJsonToList(List<dynamic> data) {
    var myModels = (data as List)
        .map((itemWord) => res_personal_history.fromJson(itemWord))
        .toList();
    return myModels;
  }
}
