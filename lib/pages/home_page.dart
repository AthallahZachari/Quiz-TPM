import 'package:flutter/material.dart';
import 'package:quiz/components/my_button.dart';
import 'package:quiz/pages/list_characters.dart';
import 'package:quiz/pages/weapons.dart';

class myHomePage extends StatefulWidget{
  @override 
  _myHomePageState createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage>{

  @override
  Widget build(BuildContext context){
    
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 50),
          const Text(
            'Genshin Impact',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 50),
          MyRealButton(
            text: 'Characters',
            width: MediaQuery.of(context).size.width*0.9,
            height: 60, 
            onTap: () {
              print('to Characters');
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context){
                    return CharacterPage();
                  }
                ),
              );
            },
          ),

          const SizedBox(height: 10),
          MyRealButton(
            text: 'Weapon',
            width: MediaQuery.of(context).size.width*0.9,
            height: 60, 
            onTap: () {
              print('to Weapons');
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context){
                    return WeaponPage();
                  }
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}