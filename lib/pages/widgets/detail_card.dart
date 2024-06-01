import 'package:flutter/material.dart';
import 'package:quiz/models/detail_weapon_model.dart';

class DetailWidget extends StatelessWidget{
  final DetailWeaponModel? weaponDetail;
  
  DetailWidget({this.weaponDetail});

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Name: ${weaponDetail!.name}'),
        Text('Type: ${weaponDetail!.type}'),
        Text('rarity: ${weaponDetail!.rarity}'),
        Text('Attack: ${weaponDetail!.baseAttack}'),
      ],
    );
  }
}