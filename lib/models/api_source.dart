import 'package:quiz/models/base.dart';

class ApiDataSource{
  static ApiDataSource instance = ApiDataSource();

  static Future<Map<String, dynamic>> loadCharacters(String name) {
    return BaseNetwork.get("characters");
  }

  static Future<Map<String, dynamic>> loadWeapons(String name) {
    return BaseNetwork.get("weapons");
  }

}