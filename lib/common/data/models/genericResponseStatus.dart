class GenericResponseStatus {
  String? resulTOBJ;
  String? resulTSTATUS;
  String? resulTCODE;
  String? resulTMESSAGE;

  GenericResponseStatus(
      {this.resulTOBJ, this.resulTSTATUS, this.resulTCODE, this.resulTMESSAGE});

  GenericResponseStatus.fromJson(Map<String, dynamic> json) {
    resulTOBJ = json['resulT_OBJ'];
    resulTSTATUS = json['resulT_STATUS'];
    resulTCODE = json['resulT_CODE'];
    resulTMESSAGE = json['resulT_MESSAGE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resulT_OBJ'] = this.resulTOBJ;
    data['resulT_STATUS'] = this.resulTSTATUS;
    data['resulT_CODE'] = this.resulTCODE;
    data['resulT_MESSAGE'] = this.resulTMESSAGE;
    return data;
  }
}
