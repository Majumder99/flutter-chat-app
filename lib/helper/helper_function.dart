import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  //keys
  static String useLoggedInKey = "LOGGEDIN";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";

  //saving the data to sf

  //getting the data form sf
  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(useLoggedInKey);
  }
}
