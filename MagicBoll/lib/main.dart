import 'package:flutter/material.dart';
import 'dart:math';

import 'constants.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int numball=1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        backgroundColor: BgColor,
          appBar: AppBar(
            backgroundColor: kAppBarColor,
            title:Text('ASK ME ANYTHING',
              style:TextStyle(
              fontFamily: 'Rubik',
              fontSize: 15,
              ),
            ),
          ),
        body:Center(
            child:Container(
              child:TextButton(
                onPressed: (){
                  setState(() {
                    numball=Random().nextInt(5)+1;
                    print('Image Cliqué');
                  });
                },
                child:Image(image:AssetImage('images/ball$numball.png'),
                ),
              ),
            ),
        ),
      ),
    );
  }
}
