import 'package:flutter/material.dart';

Widget ListCard({
  required context, 
  required title,
  String? image = "",
  }) {

  final bool isImageAvail = (image == "") ? false : true;

  return Container(
    margin: EdgeInsets.only(top: 15, right: 15, left:15),
    padding: EdgeInsets.all(12),
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      /* boxShadow:  [
        BoxShadow(color: const Color.fromARGB(255, 199, 199, 199).withOpacity(0.5), blurRadius: 3, spreadRadius: 3, offset: Offset(0, 3)),
      ], */
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey[300]
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          /* child: Image.network(
            "$image",
            fit: BoxFit.cover,
          ), */
          child: isImageAvail ? 
          Image.network(
            "$image",
            fit: BoxFit.cover,
          ) : 
          Image.asset("/images/onboarding_2.gif"), 
          
        ),
        SizedBox(width: 10),
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.indigo[500],
              ),
            ),
            Text("See Details", style: TextStyle(fontSize: 12, color: Colors.grey),)
          ],
        ),
      ],
    ),
  );
}
