import 'package:flutter/material.dart';
import '../utilites/color_model.dart';

class TextFormInput extends StatelessWidget{
  String displayText='';

  String fieldName;
  TextEditingController textEditControl;
  TextFormInput({required this.fieldName,required this.textEditControl,
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(style: TextStyle(color:AppColor.white),controller: textEditControl,
      decoration:
      InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)  ),
          hintText: fieldName,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColor.white)),
          enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: AppColor.white) ),
          hintStyle: TextStyle(color: AppColor.white)),

    );
  }
}