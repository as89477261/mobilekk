class resDetail {
  int? id;
  String? sessioNID;
  String? raWTEXTPHASE;
  String? resulTTEXTPHASE;
  String? iSFRUAD;
  String? risKLEVEL;
  String? status;
  String? creatEDATE;
  String? creatEBY;
  String? lisTDETAIL;

  resDetail(
      {this.id,
      this.sessioNID,
      this.raWTEXTPHASE,
      this.resulTTEXTPHASE,
      this.iSFRUAD,
      this.risKLEVEL,
      this.status,
      this.creatEDATE,
      this.creatEBY,
      this.lisTDETAIL});

  resDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sessioNID = json['sessioN_ID'];
    raWTEXTPHASE = json['raW_TEXT_PHASE'];
    resulTTEXTPHASE = json['resulT_TEXT_PHASE'];
    iSFRUAD = json['iS_FRUAD'];
    risKLEVEL = json['risK_LEVEL'];
    status = json['status'];
    creatEDATE = json['creatE_DATE'];
    creatEBY = json['creatE_BY'];
    lisTDETAIL = json['lisT_DETAIL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sessioN_ID'] = this.sessioNID;
    data['raW_TEXT_PHASE'] = this.raWTEXTPHASE;
    data['resulT_TEXT_PHASE'] = this.resulTTEXTPHASE;
    data['iS_FRUAD'] = this.iSFRUAD;
    data['risK_LEVEL'] = this.risKLEVEL;
    data['status'] = this.status;
    data['creatE_DATE'] = this.creatEDATE;
    data['creatE_BY'] = this.creatEBY;
    data['lisT_DETAIL'] = this.lisTDETAIL;
    return data;
  }

  static List<resDetail> fromJsonToList(List<dynamic> data) {
    var myModels =
        (data as List).map((itemWord) => resDetail.fromJson(itemWord)).toList();
    return myModels;
  }
}
