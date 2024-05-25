import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quiz/models/detail_weapon_model.dart';

class WeaponPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Weapons'),
          ],
        ),
      ),
      body: Container(
        /* child: DetailWeaponModel(

        ), */
      ),
    );
  }
}
