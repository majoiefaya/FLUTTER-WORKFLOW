import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int de_degauche=1;
  int de_dedroite=1;

  void rechargerde(){
    setState((){
      de_degauche=Random().nextInt(6)+1;
      de_dedroite=Random().nextInt(6)+1;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text(
            "Jeux de dée IPNET",
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: (){
                    print(de_degauche);
                    rechargerde();
                  },
                  child: Image(
                    image: AssetImage('images/dice$de_degauche.png'),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: (){
                    print(de_dedroite);
                  },
                  child: Image(
                    image: AssetImage('images/dice$de_dedroite.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
