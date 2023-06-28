class reqVerifyOTPModel {
  String? phonENUMBER;
  String? regisTOTP;

  reqVerifyOTPModel({this.phonENUMBER, this.regisTOTP});

  reqVerifyOTPModel.fromJson(Map<String, dynamic> json) {
    phonENUMBER = json['phonE_NUMBER'];
    regisTOTP = json['regisT_OTP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phonE_NUMBER'] = this.phonENUMBER;
    data['regisT_OTP'] = this.regisTOTP;
    return data;
  }
}
