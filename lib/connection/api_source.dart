import 'package:quiz/connection/base.dart';
import 'package:http/http.dart';
import 'package:quiz/models/detail_weapon_model.dart';

/* class ApiDataSource{
  static ApiDataSource instance = ApiDataSource();
  
  Future<List<String>> loadWeapons() async {
    return BaseNetwork.get("weapons");
  }

} */

class ApiDataSource{
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> getWeaponDetails(String weaponName){
    return BaseNetwork.getWeaponDetails("$weaponName");
  }

  Future<Map<String, dynamic>> getCharacterDetails(String characterName){
    return BaseNetwork.getWeaponDetails("$characterName");
  } 

}