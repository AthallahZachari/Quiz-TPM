import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz/models/detail_char_model.dart';
import 'package:quiz/models/detail_weapon_model.dart';

class BaseNetwork {
  static final String baseWeaponUrl = "https://genshin.jmp.blue/weapons";

  static Future<Map<String, dynamic>> getWeaponDetails(String partUrl) async {
    final String fullUrl = "$baseWeaponUrl" + "/" + "$partUrl";
    final response = await http.get(Uri.parse(fullUrl));
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body;
    print(body);
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      throw Exception('Failed to load Data');
    }
  }

  Future<List<String>> fetchMainWeapons() async {
    final response =
        await http.get(Uri.parse('https://genshin.jmp.blue/weapons'));
    if (response.statusCode == 200) {
      // Parse the JSON response
      final weapons = (jsonDecode(response.body) as List).cast<String>();
      return weapons;
    } else {
      // Handle error
      throw Exception('Failed to load weapons');
    }
  }

  Future<List<String>> fetchMainCharacters() async {
    final response =
        await http.get(Uri.parse('https://genshin.jmp.blue/characters'));
    if (response.statusCode == 200) {
      // Parse the JSON response
      final weapons = (jsonDecode(response.body) as List).cast<String>();
      return weapons;
    } else {
      // Handle error
      throw Exception('Failed to load weapons');
    }
  }

  Future<DetailWeaponModel> fetchWeaponDetail(String weaponName) async{
    final res = await http.get(Uri.parse('https://genshin.jmp.blue/weapons/$weaponName'));
    if (res.statusCode == 200) {
      return DetailWeaponModel.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to load weapon detail!');
    }
  }
  Future<DetailCharModel> fetchCharacterDetail(String charName) async{
    final res = await http.get(Uri.parse('https://genshin.jmp.blue/characters/$charName'));
    if (res.statusCode == 200) {
      return DetailCharModel.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to load weapon detail!');
    }
  } 
}
