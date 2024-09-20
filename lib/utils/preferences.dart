import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences _prefs;

Future<void> setupPreferences() async {
  _prefs = await SharedPreferences.getInstance();
}

const userData = 'user_data';

class UserPreferences {
 
  
  static setUserData({required String value}){
    _prefs.setString(userData, value);
  }

  static String getUserData(){
    return _prefs.getString(userData)??'';
  }
  static Future<void> eraseData() async {
    await _prefs.clear();
  }

  
}
