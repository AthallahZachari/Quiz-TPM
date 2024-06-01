import 'package:flutter/material.dart';
import 'package:quiz/components/my_button.dart';
import 'package:quiz/pages/list_characters.dart';
import 'package:quiz/pages/list_weapon.dart';

class myHomePage extends StatefulWidget {
  @override
  _myHomePageState createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("/images/genshin.jpg"), fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 50),
                const SizedBox(height: 50),
                MyRealButton(
                  text: 'Characters',
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return CharacterPage();
                      }),
                    );
                  },
                ),
                const SizedBox(height: 10),
                MyRealButton(
                  text: 'Weapon',
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return WeaponPage();
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
