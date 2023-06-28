import 'package:oic_next_to_you/common/domain/entities/user/userprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class Session {
// GET REGISTER STATUS
  Future<String> GetRegisterStatus() async {
    final SharedPreferences prefs = await _prefs;
//FINISH / UNFINISH
    return prefs.getString('RegisterStatus') ?? '';
  }

  SetRegisterStatus(String registerStatus) async {
    final SharedPreferences prefs = await _prefs;

    await prefs.setString('RegisterStatus', registerStatus);
  }

// GET SEC_STEP_PHONENO
  Future<String> GetUserID() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString('CUR_USERID') ?? '';
  }

  SetUserID(String value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString('CUR_USERID', value);
  }

// GET KEY_LICENSE_NO
  Future<String> GetPhoneNumber() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString('CUR_PHONE_NUMBER') ?? '';
  }

  SetPhoneNumber(String value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString('CUR_PHONE_NUMBER', value);
  }

  // GET KEY_LICENSE_TYPE_CODE
  Future<String> GetConsentStatus() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString('CUR_CONSENT_STATUS') ?? '';
  }

  SetConsentStatus(String value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString('CUR_CONSENT_STATUS', value);
  }

  // GET KEY_LICENSE_TYPE_CODE
  Future<String> GetRecordSessionID() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString('CUR_RECORD_SESSION_ID') ?? '';
  }

  SetRecordSessionID(String value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString('CUR_RECORD_SESSION_ID', value);
  }

  // GET KEY_LICENSE_TYPE_CODE
  Future<String> GetRecordAgentID() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString('CUR_RECORD_AGENT_ID') ?? '';
  }

  SetRecordAgentID(String value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString('CUR_RECORD_AGENT_ID', value);
  }

  // GET KEY_LICENSE_TYPE_CODE
  Future<String> GetRecordAgentFullName() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('CUR_RECORD_AGENT_FULL_NAME') ?? '';
  }

  SetRecordAgentFullName(String value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString('CUR_RECORD_AGENT_FULL_NAME', value);
  }

  // GET KEY_LICENSE_TYPE_CODE
  Future<String> GetCurrentOTP() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString('CUR_OTP') ?? '';
  }

  SetCurrentOTP(String value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString('CUR_OTP', value);
  }

//-------------//////////// GET PERSONAL_INFO
  Future<userprofile> GetSessionPersonal() async {
    final SharedPreferences prefs = await _prefs;
    var obj = new userprofile();
    obj.uid = prefs.getString('CUR_USERID') ?? '';
    obj.phonENUMBER = prefs.getString('CUR_PHONE_NUMBER') ?? '';
    obj.consentStatus = prefs.getString('CUR_CONSENT_STATUS') ?? '';

    return obj;
  }
}
