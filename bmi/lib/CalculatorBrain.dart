import 'dart:math';

import 'package:flutter/material.dart';
class CalculatorBrain{
  final int taille;
  final int poids;
  double _bmi=0;

  CalculatorBrain({required this.taille,required this.poids});

    String CalculDuBMI(){
      _bmi=poids/pow(taille/100,2);
      //return _bmi.toString();
      return _bmi.toStringAsFixed(1);
    }

    String getResultat(){
      if(_bmi>=25){
        return 'Surpoids';
      }else if(_bmi>18.5){
        return 'Normal';
      }
      return 'insuffisance pondérale';
    }

  String getInterpretation(){
    if(_bmi>=25){
      return 'Surpoids';
    }else if(_bmi>18.5){
      return 'Normal';
    }
    return 'insuffisance pondérale.Vous pouvez manger un peu plus';
  }

    /*final String mon_bmi;
    final String mon_resultat;
    final String interpretation;
    CalculatorBrain cal=CalculatorBrain(taille: ma_taille, poids: mon_poids)*/
    //ResultatPage({required this.mon_bmi,required this.mon_resultat,required this.interpretation})
    //Navigator.push(context,MaterialPageRoute(builder:(context)=>ResultPage(
          //mon_bmi:cal.CalculDuBMI(),
          //mon_resultat:cal.getResult();
          //interpretation:cal.getInterpretation(),
      //)));
}