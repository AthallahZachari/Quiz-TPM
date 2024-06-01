import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/connection/base.dart';
import 'package:quiz/models/detail_weapon_model.dart';
import 'package:quiz/pages/widgets/detail_card.dart';

class WeaponDetailPage extends StatelessWidget {
  final String weaponName;
  final String? weaponImage;

  const WeaponDetailPage({required this.weaponName, this.weaponImage});

  @override
  Widget build(BuildContext context) {
    final instance = BaseNetwork();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '$weaponName',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
      ),
      body: FutureBuilder<DetailWeaponModel>(
        future: instance.fetchWeaponDetail(weaponName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            final weaponDetail = snapshot.data!;
            //return Row();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.network("$weaponImage",
                          fit: BoxFit.cover, scale: 2.0),
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${weaponDetail.name}',
                          style: TextStyle(
                              color: Colors.indigo[500],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: List.generate(
                              weaponDetail.rarity!,
                              (index) => Icon(
                                    CupertinoIcons.star_fill,
                                    color: Colors.pinkAccent,
                                  )),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Passive : ${weaponDetail.passiveName}',
                          style: TextStyle(
                              color: Colors.deepPurple[300],
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${weaponDetail.passiveDesc}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
