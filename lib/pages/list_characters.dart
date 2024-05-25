import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quiz/models/detail_char_model.dart';
import 'package:quiz/models/detail_weapon_model.dart';

class CharacterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Characters'),
          ],
        ),
      ),
      body: Container(
        /* child: DetailCharModel(

        ), */
      ),
    );
  }
}
