import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:quiz/connection/base.dart';
import 'package:quiz/models/detail_char_model.dart';
import 'package:quiz/models/detail_weapon_model.dart';
import 'package:quiz/pages/widgets/detail_card.dart';

class CharacterDetailPage extends StatelessWidget {
  final String charName;

  const CharacterDetailPage({required this.charName});

  @override
  Widget build(BuildContext context) {
    final instance = BaseNetwork();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '$charName',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo
          ),
        ),
      ),
      body: FutureBuilder<DetailCharModel>(
        future: instance.fetchCharacterDetail(charName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data found'));
          } else {
            final charDetail = snapshot.data!;
            final String imageCover =
                'https://genshin.jmp.blue/characters/$charName/gacha-splash';
            final String nationImage =
                'https://genshin.jmp.blue/nations/${charDetail.nation!.toLowerCase()}/icon';
            //return Row();
            return Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 25, left: 15, right: 15,),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 15),
                      CachedNetworkImage(
                        imageUrl: imageCover,
                        placeholder: (contect, url) =>
                            CircularProgressIndicator(),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: nationImage,
                            width: 100,
                            height: 100,
                            placeholder: (contect, url) =>
                                CircularProgressIndicator(),
                          ),
                          Text(
                            '${charDetail.name}',
                            style: TextStyle(
                                color: Colors.indigo[400],
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('${charDetail.description}', style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold)),

                      for (var skill in charDetail.skillTalents!)
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${skill.name}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.deepPurple[300],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              Text('${skill.description}', style: TextStyle(color: Colors.grey[600])),
                            ],
                          ),
                        ),
                    ]),
              ),
            );
          }
        },
      ),
    );
  }
}
