import 'package:flutter/material.dart';
import '../utilites/color_model.dart';

class TextFormInput extends StatelessWidget {
  TextInputType keyBoardType;
  String? Function(String?)? validator;
  String fieldName;

  TextEditingController textEditControl;
  TextFormInput({
    required this.fieldName,
    required this.textEditControl,
    required this.keyBoardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyBoardType,
      style: TextStyle(color: AppColor.white),
      controller: textEditControl,
      decoration: InputDecoration(
        border: builtOutLineInputBorder(),
        hintText: fieldName,
        focusedBorder: builtOutLineInputBorder(),
        enabledBorder: builtOutLineInputBorder(),
        hintStyle: TextStyle(color: AppColor.white),
        errorStyle: TextStyle(color: AppColor.white, fontSize: 15),
      ),
    );
  }

  OutlineInputBorder builtOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColor.white,width: 2),
    );
  }
}
