import 'package:flutter/material.dart';
import '../utilites/color_model.dart';

class TextWidget extends StatelessWidget{
  String textName ;
  Color textColor ;
  double fontSize;
  FontWeight fontWight ;
  TextWidget({required this.fontSize,required this.fontWight,
    required this.textColor,required this.textName});


  @override
  Widget build(BuildContext context) {

    return Text(textName,textAlign: TextAlign.left,
      style: TextStyle(
          color:textColor ,
          fontSize:fontSize ,
          fontWeight: fontWight),);
  }
}