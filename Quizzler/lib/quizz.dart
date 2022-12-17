import 'dart:io';

import 'package:flutter/material.dart';
import 'Question.dart';



class PageQuizz extends StatefulWidget{
  @override
  _PageQuizz createState()=> new _PageQuizz();
}

class _PageQuizz extends State<PageQuizz>{
  Question? question;

  List<Question> listeQuestions = [
    new Question('La devise de la Belgique est l\'union fait la force', true, '', 'belgique.JPG'),
    new Question('La lune va finir par tomber sur terre à cause de la gravité', false, 'Au contraire la lune s\'éloigne', 'lune.jpg'),
    new Question('La Russie est plus grande en superficie que Pluton', true, '', 'russie.jpg'),
    new Question('Nyctalope est une race naine d\'antilope', false, 'C’est une aptitude à voir dans le noir', 'nyctalope.jpg'),
    new Question('Le Commodore 64 est l\’oridnateur de bureau le plus vendu', true, '', 'commodore.jpg'),
    new Question('Le nom du drapeau des pirates es black skull', false, 'Il est appelé Jolly Roger', 'pirate.png'),
    new Question('Haddock est le nom du chien Tintin', false, 'C\'est Milou', 'tintin.jpg'),
    new Question('La barbe des pharaons était fausse', true, 'A l\'époque déjà ils utilisaient des postiches', 'pharaon.jpg'),
    new Question('Au Québec tire toi une bûche veut dire viens viens t\'asseoir', true, 'La bûche, fameuse chaise de bucheron', 'buche.jpg'),
    new Question('Le module lunaire Eagle de possédait de 4Ko de Ram', true, 'Dire que je me plains avec mes 8GO de ram sur mon mac', 'eagle.jpg'),
  ];

  int index = 0;
  int score = 0;

  @override
  void initState(){
    super.initState();
    question = listeQuestions[index];
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Page quizz"),
      ),
      body: new Center(
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              new Text("Question numero ${index+1}"),
              new Text("Score : ${score}/${index}"),
              Container(
                width: 350,
                height: 350,
                color: Colors.red,
                child: Image.asset("assets/${question?.imagePath}",
                  fit: BoxFit.cover,),
              ),
              new Text("${question?.question}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  TextButton(onPressed: (){
                    dialogue(true);
                  }, child: new Text("Vrai")),
                  SizedBox(width: 50),
                  TextButton(onPressed: (){
                    dialogue(false);
                  }, child: new Text("Faux"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> dialogue(bool b) async{
    String vrai = "assets/vrai.png";
    String faux = "assets/faux.png";
    bool bonneReponse = (b == question?.reponse);
    if(bonneReponse){
      score++;
    }
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return new SimpleDialog(
            title: new Text(bonneReponse? "Bonne reponse":"Mauvaise reponse",style: TextStyle(color: (bonneReponse)? Colors.blue : Colors.red),),
            contentPadding: EdgeInsets.all(20.0),
            children: [
              new Image.asset(bonneReponse? vrai : faux,fit: BoxFit.cover,),
              new Container(height: 25.0),
              new Text("${question?.explication}",style: TextStyle(color: Colors.grey[900]),),
              new Container(height: 25.0,),
              new TextButton(onPressed: () {
                Navigator.pop(context);
                questionSuivante();
              }, child: new Text("Suivant")),

            ],
          );
        });
  }

  Future<Null> alerte() async {
    return showDialog(context: context,
        builder: (BuildContext buildContext){
          return new AlertDialog(
            title: new Text("Partie terminée",style: TextStyle(color: Colors.blue),),
            contentPadding: EdgeInsets.all(10.0),
            content: new Text("Votre Score finale est $score/${index+1}"),
            actions: [
              new TextButton(onPressed: (){
                Navigator.pop(buildContext);
                Navigator.pop(context);
              }, child: new Text("Ok"))
            ],
          );
        });
  }

  void questionSuivante(){
    if(index < listeQuestions.length - 1){
      index++;
      setState(() {
        question = listeQuestions[index];

      });

    }else{
      alerte();
    }
  }
}