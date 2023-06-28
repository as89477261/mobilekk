class userprofile {
  int? id;
  String? phonENUMBER;
  String? firstname;
  String? lastname;
  String? idcard;
  String? status;
  String? creatEDATE;
  String? creatEBY;
  String? updatEDATE;
  String? updatEBY;
  String? regisTOTP;
  String? iSOTP;
  String? personaLCODE;
  String? uid;
  String? consentStatus;

  userprofile(
      {this.id,
      this.phonENUMBER,
      this.firstname,
      this.lastname,
      this.idcard,
      this.status,
      this.creatEDATE,
      this.creatEBY,
      this.updatEDATE,
      this.updatEBY,
      this.regisTOTP,
      this.iSOTP,
      this.personaLCODE});

  userprofile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phonENUMBER = json['phonE_NUMBER'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    idcard = json['idcard'];
    status = json['status'];
    creatEDATE = json['creatE_DATE'];
    creatEBY = json['creatE_BY'];
    updatEDATE = json['updatE_DATE'];
    updatEBY = json['updatE_BY'];
    regisTOTP = json['regisT_OTP'];
    iSOTP = json['iS_OTP'];
    personaLCODE = json['personaL_CODE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phonE_NUMBER'] = this.phonENUMBER;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['idcard'] = this.idcard;
    data['status'] = this.status;
    data['creatE_DATE'] = this.creatEDATE;
    data['creatE_BY'] = this.creatEBY;
    data['updatE_DATE'] = this.updatEDATE;
    data['updatE_BY'] = this.updatEBY;
    data['regisT_OTP'] = this.regisTOTP;
    data['iS_OTP'] = this.iSOTP;
    data['personaL_CODE'] = this.personaLCODE;
    return data;
  }
}
