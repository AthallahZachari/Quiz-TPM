import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quiz/connection/base.dart';
import 'package:quiz/components/list_card.dart';
import 'package:quiz/components/detail_weapon.dart';

class WeaponPage extends StatefulWidget {
  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<WeaponPage> {
  Future<List<String>>? _weaponList;
  final BaseNetwork _client = BaseNetwork();

  @override
  void initState() {
    super.initState();
    try {
      _weaponList = _client.fetchMainWeapons();
    } on Exception catch (e) {
      print('Error fetching weapons: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Genshin Weapons",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<String>>(
          future: _weaponList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final weaponName = snapshot.data![index];
                  final String imageUrl = 'https://genshin.jmp.blue/weapons/$weaponName/icon';
                  return GestureDetector(
                      child: ListCard(context: context, title: weaponName, image: imageUrl),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeaponDetailPage(weaponName: weaponName, weaponImage: imageUrl,)));
                      });
                  //return Text(weapon);
                },
              );
            } else if (snapshot.hasError) {}
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
