
import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title:Text('BMI RESULTAT')
    ),
    body:Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        Expanded(
          child:Container(
            child:Text(
              'mon resultat',
                  style:TextStyle(
                fontSize:30
              )
            )
          )
        ),
        Expanded(
            child:Container(
                child:Text(
                    'En Surpoids',
                    style:TextStyle(
                        fontSize:30,
                      color:Colors.green
                    )
                )
            )
        )
      ]
    )
  );
}
}
