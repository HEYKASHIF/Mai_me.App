import 'package:shared_preferences/shared_preferences.dart';

class SaveMyData {
  static String memekey = "MEMEKEY";

  static Future<bool> saveData(int val) async {
    final inst = await SharedPreferences.getInstance();
    return await inst.setInt(memekey, val);
  }

  static Future<int?> fetchData() async {
    final inst = await SharedPreferences.getInstance();
    return await inst.getInt(memekey);
  }
}
